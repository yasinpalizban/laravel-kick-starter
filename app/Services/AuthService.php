<?php namespace App\Services;


use App\Config\AuthConfig;
use App\Config\SharedConfig;
use App\Entities\AuthEntity;
use App\Interfaces\AuthServiceInterface;
use App\Libraries\MainService;
use App\Libraries\Sms;
use App\Mails\ActivationEmail;
use App\Mails\ForgotEmail;
use App\Models\GroupModel;
use App\Models\GroupUserModel;
use App\Models\IpActivityModel;
use App\Models\PermissionGroupModel;
use App\Models\PermissionModel;
use App\Models\PermissionUserModel;
use App\Models\UserModel;
use DateTime;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class AuthService extends MainService implements AuthServiceInterface
{

    private GroupModel $groupModel;
    private PermissionModel $permissionModel;
    private AuthConfig $authConfig;
    private UserModel $userModel;
    private GroupUserModel $groupUserModel;
    private IpActivityModel $ipActivityModel;
    private SharedConfig $sharedConfig;
    private Sms $sms;
    private PermissionGroupModel $permissionGroupModel;
    private PermissionUserModel $permissionUserModel;

    public function __construct()
    {

        $this->userModel = new UserModel();
        $this->authConfig = new  AuthConfig();
        $this->groupModel = new GroupModel();
        $this->groupUserModel = new GroupUserModel();
        $this->permissionModel = new PermissionModel();
        $this->ipActivityModel = new IpActivityModel();
        $this->sharedConfig = new SharedConfig();
        $this->sms = new Sms($this->sharedConfig->sms['userName'],
            $this->sharedConfig->sms['password'],
            0);
        $this->permissionGroupModel = new PermissionGroupModel();
        $this->permissionUserModel = new PermissionUserModel();

    }

    public function signUp(AuthEntity $entity): object
    {

        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        if ($entity->loginType == 'email') {

            $findUser = UserModel::where(['email' => $entity->email,
                'username' => $entity->username])->first();
            if ($findUser) {
                $this->ipActivityModel->create([
                    'user_id' => 0,
                    'ip_address' => $entity->ipAddress,
                    'user_agent' => $entity->userAgent,
                    'date' => date('Y-m-d H:i:s', time()),
                    'success' => false,
                    'type' => 'sign-up'

                ]);
                throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.youAreEmail'));
            }
            try {
                Mail::to($entity->email)->send(new ActivationEmail($entity->activeToken, __('api.events.emailActivation')));

            } catch (\Exception $e) {
                throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('auth.emailSendErrorActivation'));

            }

        } else if ($entity->loginType == 'phone') {

            $findUser = UserModel::where(['phone' => $entity->phone,
                'username' => $entity->username])->first();
            if ($findUser) {
                $this->ipActivityModel->create([
                    'user_id' => 0,
                    'ip_address' => $entity->ipAddress,
                    'user_agent' => $entity->userAgent,
                    'date' => date('Y-m-d H:i:s', time()),
                    'success' => false,
                    'type' => 'sign-up'

                ]);
                throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.yourArePhone'));
            }
            $isSend = $this->sms->sendActivationCode($entity->phone, getenv('site_address'));

            if ($isSend < 2000) {
                throw new HttpException(ResponseAlias::HTTP_FOUND, __('auth.smsSendFail'));

            }


        }
        $createUser = $this->userModel->create($entity->getArray());

        if (!$createUser) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        $this->ipActivityModel->create([
            'user_id' => 0,
            'ip_address' => $entity->ipAddress,
            'user_agent' => $entity->userAgent,
            'date' => date('Y-m-d H:i:s', time()),
            'success' => true,
            'type' => 'sign-up'

        ]);


        $group = $this->groupModel->where('name', $entity->role)->get();
        $this->groupUserModel->create(['group_id' => $group[0]->id,
            'user_id' => $createUser->id]);

        return $createUser;
    }

    public function signOut(AuthEntity $entity): void
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        $findUser = $this->userModel->where("id", $entity->id)->first();

        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_UNAUTHORIZED, __('auth.youAreNot'));
    }

    public function signIn(AuthEntity $entity): array
    {


        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        $findUser = UserModel::where($entity->loginType, $entity->login)->first();


        if (!$findUser) {
            $this->ipActivityModel->create([
                'user_id' => 0,
                'ip_address' => $entity->ipAddress,
                'user_agent' => $entity->userAgent,
                'date' => date('Y-m-d H:i:s', time()),
                'success' => false,
                'type' => 'sign-in'

            ]);
            throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.accountNotExist'));
        }


        if (!Hash::check($entity->password, $findUser->password)) {

            $this->ipActivityModel->create([
                'user_id' => $findUser->id,
                'ip_address' => $entity->ipAddress,
                'user_agent' => $entity->userAgent,
                'date' => date('Y-m-d H:i:s', time()),
                'success' => false,
                'type' => 'sign-in'

            ]);
            throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.accountNotExist'));

        }

        if ($findUser->active == false) {
            $this->ipActivityModel->create([
                'user_id' => $findUser->id,
                'ip_address' => $entity->ipAddress,
                'user_agent' => $entity->userAgent,
                'date' => date('Y-m-d H:i:s', time()),
                'success' => false,
                'type' => 'sign-in'

            ]);
            throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.accountNotConfirm'));

        }
        if ($findUser->status == true) {

            $this->ipActivityModel->create([
                'user_id' => $findUser->id,
                'ip_address' => $entity->ipAddress,
                'user_agent' => $entity->userAgent,
                'date' => date('Y-m-d H:i:s', time()),
                'success' => false,
                'type' => 'sign-in'

            ]);

            throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.accountBan'));

        }


        $this->ipActivityModel->create([
            'user_id' => $findUser->id,
            'ip_address' => $entity->ipAddress,
            'user_agent' => $entity->userAgent,
            'date' => date('Y-m-d H:i:s', time()),
            'success' => true,
            'type' => 'sign-in'

        ]);


        $groupUser = $this->groupUserModel->where('user_id', $findUser->id)->get();

        $group = $this->groupModel->where('id', $groupUser[0]->group_id)->get();

        $permissions = $this->permissionModel->where('active', '1')->get();

        $permissionUser = $this->permissionUserModel->permissionsOfUser($findUser->id)->get();

        $permissionGroup = $this->permissionGroupModel->permissionsOfGroup($group[0]->id)->get();

        $timeJwt = isset($entity->remember) && $entity->remember ? timeJwt(true) : timeJwt(false);

        $jwtToken = generateJWT($findUser->id, $timeJwt['init'], $timeJwt['expire'], $this->authConfig->jwt['secretKey']);


        if ($findUser->image) {

            $arr = explode('/', $findUser->image);
            $arr[0] = getenv('APP_ENV') == "local" ? 'storage' : 'storage/app/' . $arr[0];
            $temp = implode('/', $arr);
            $findUser->image = $temp;
        }


        $data = [
            'success' => true,
            'role' => [
                'name' => $group[0]->name,
                'id' => $group[0]->id
            ],
            'permissions' => $permissions,
            'permissionUser' => $permissionUser,
            'permissionGroup' => $permissionGroup,
            'userInformation' => [
                'id' => $findUser->id,
                'userName' => $findUser->username,
                'image' => $findUser->image,
                'firstName' => $findUser->first_name,
                'lastName' => $findUser->last_name,
                'email' => $findUser->email,
                'phone' => $findUser->phone,
            ],
            'csrf' => 'no-init',
            'jwt' => [
                "token" => $jwtToken,
                "expire" => $timeJwt['expire'],
            ],

        ];


        return $data;


    }


    public function forgot(AuthEntity $entity): void
    {

        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $findUser = $this->userModel->where($entity->loginType, $entity->login)->first();

        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_UNAUTHORIZED, __('auth.youAreNotUserName'));

        $statusSms = 0;
        if (!is_null($findUser->email)) {
            try {
                Mail::to($findUser->email)->send(new ForgotEmail($entity->resetToken, __('api.events.emailForgot')));
            } catch (\Exception $e) {
                throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('auth.emailSendErrorForgot'));
            }

        }


        if (!is_null($findUser->phone)) {

            $statusSms = $this->sms->sendActivationCode($findUser->phone, getenv('site_address'));
            if ($statusSms < 2000) {

                throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('auth.emailSendErrorForgot'));
            }
        }



        unset($entity->login);
        unset($entity->loginType);
        unset($entity->ipAddress);
        unset($entity->userAgent);

        $this->userModel->where('id', $findUser->id)->update($entity->getArray());


    }

    public function resetPasswordViaSms(AuthEntity $entity): void
    {

        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        $findUser = $this->userModel->where('phone', $entity->phone)->first();;


        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.yourAreNotPhone'));


        if (!$this->sms->isActivationCodeValid($entity->phone, $entity->resetToken)) throw new HttpException(ResponseAlias::HTTP_NOT_ACCEPTABLE, __('auth.tokenExpire'));

        $entity->resetPassword()->generatePassword();
        unset($entity->phone);
        $this->userModel->where('id', $findUser->id)->update($entity->getArray());


    }


    public function resetPasswordViaEmail(AuthEntity $entity): void
    {

        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        $findUser = $this->userModel->where('email', $entity->email)->first();;


        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.youAreNotAccount'));


        $date = new DateTime($findUser->reset_expires . '');

        if (!empty($findUser->reset_expires) && time() > $date->getTimestamp()) throw new HttpException(ResponseAlias::HTTP_NOT_ACCEPTABLE, __('auth.tokenExpire'));
        $entity->resetPassword()->generatePassword();
        unset($entity->email);
        $this->userModel->where('id', $findUser->id)->update($entity->getArray());


    }

    public function activateAccountViaEmail(AuthEntity $entity): void
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $findUser = $this->userModel
            ->where(['active' => 0,
                'active_token'=> $entity->activeToken, 'email'=> $entity->email])
            ->first();

        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.youAreNotUsername'));
        $date = new DateTime($findUser->active_expires . '');

        if (!empty($findUser->active_expires) && time() > $date->getTimestamp()) throw new HttpException(ResponseAlias::HTTP_NOT_ACCEPTABLE, __('auth.tokenExpire'));


        unset($entity->email);
        unset($entity->activeToken);
        $this->userModel->where('id', $findUser->id)->update($entity->getArray());


    }

    public function sendActivateCodeViaEmail(AuthEntity $entity): void
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $findUser = $this->userModel->where([
            'email', $entity->email,
            'active' => 0])
            ->first();

        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('uth.youAreNotEmail'));

        try {
            Mail::to($entity->email)->send(new ActivationEmail($entity->activeToken, __('api.events.emailActivation')));
        } catch (\Exception $e) {

            throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('auth.emailSendErrorActivation'));

        }
        unset($entity->email);

        $this->userModel->where('id', $findUser->id)->update($entity->getArray());


    }

    public function activateAccountViaSms(AuthEntity $entity): void
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $result = $this->sms->isActivationCodeValid($entity->phone,
            $entity->activeToken);

        if ($result == false) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.tokenExpire'));

        $findUser = $this->userModel
            ->where(['phone' => $entity->phone,
                'active' => 0])->first();

        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.youAreNotAccount'),);

        unset($entity->phone);
        unset($entity->activeToken);
        $this->userModel->where('id', $findUser->id)->update($entity->getArray());

    }

    public function sendActivateCodeViaSms(AuthEntity $entity): void
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $findUser = $this->userModel
            ->where(['phone' => $entity->phone,
                'active' => 0])->first();
        if (is_null($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth.youAreNotAccount'),);

        $result = $this->sms->sendActivationCode($entity->phone, getenv('site_address'));
        if ($result < 2000) throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('auth.smsSendFail'));
    }


}



