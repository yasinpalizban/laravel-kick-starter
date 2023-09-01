<?php


namespace App\Services;


use App\Entities\UserEntity;
use App\Filters\UserFilter;
use App\Http\Resources\UserCollection;
use App\Libraries\MainService;
use App\Models\GroupModel;
use App\Models\GroupUserModel;
use App\Models\UserModel;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;


class UserService extends MainService
{
    private UserModel $model;
    private GroupModel $groupModel;
    private GroupUserModel $groupUserModel;

    public function __construct()
    {
        parent::__construct();
        $this->model = new  UserModel();
        $this->groupModel = new GroupModel();
        $this->groupUserModel = new GroupUserModel();
    }


    public function index(UserFilter $userFilter)
    {


        $select = empty ($userFilter->getFiled()) ?
            ['users.id',
                'users.email',
                'users.username',
                'users.first_name',
                'users.last_name',
                'users.image',
                'users.gender',
                'users.birthday',
                'users.country',
                'users.city',
                'users.address',
                'users.phone',
                'users.status_message',
                'users.status',
                'users.active',
                'users.created_at',
                'users.updated_at',
                'users.deleted_at',
                'auth_groups.name as group'

            ] : $userFilter->getFiled();

        $roleUser = [];
        if ($userFilter->getForeignKey()) {
            $roleUser = [['auth_groups.id', '=', $userFilter->getForeignKey()]];
        }

        $data['data'] = $this->groupUserModel->select($select)
            ->where($userFilter->getWhereStatement())
            ->where($roleUser)
            ->leftJoin('auth_groups', 'auth_groups_users.group_id', '=', 'auth_groups.id')
            ->leftJoin('users', 'auth_groups_users.user_id', '=', 'users.id')
            ->limit($userFilter->getLimit())
            ->offset($userFilter->getPage())
            ->orderBy('users.' . $userFilter->getSort(), $userFilter->getOrder())
            ->get();

        $data ['pager'] = paginationFields($userFilter->getLimit(), $userFilter->getPage(), $this->model->count());


        return new UserCollection($data);
    }

    /**
     * show function
     * @method : GET with params ID
     * @param $id
     * @return array
     */
    public function show($id)
    {
        if (is_null($id)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api . commons . reject'));


        $group = $this->groupModel->getGroupsForUser($id);

        $result = $this->groupUserModel->select([
            'users.id',
            'users.email',
            'users.username',
            'users.first_name',
            'users.last_name',
            'users.image',
            'users.gender',
            'users.birthday',
            'users.country',
            'users.city',
            'users.address',
            'users.phone',
            'users.status_message',
            'users.status',
            'users.active',
            'users.created_at',
            'users.updated_at',
            'users.deleted_at',
            'auth_groups.name as group'])
            ->leftJoin('auth_groups', 'auth_groups_users.group_id', '=', 'auth_groups.id')
            ->leftJoin('users', 'auth_groups_users.user_id', '=', 'users.id')
            ->where('auth_groups.id', $group[0]->id)
            ->where('users.id', $id)->get();


        if (is_null($result)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api . commons . exist'));

        return [
            'data' => new UserCollection($result),
        ];

    }


    public function create(UserEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api . commons . reject'));


        if ($entity->email) {

            $findUser = UserModel::where(['email' => $entity->email])->first();


            if (!empty($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth . youAreEmail'));

        }

        if ($entity->phone) {

            $findUser = UserModel::where(['phone' => $entity->phone])->first();
            if (!empty($findUser)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('auth . yourArePhone'));


        }


        $useRole = $entity->groupId;
        unset($entity->groupId);


        $createUser = $this->model->create($entity->getArray());

        if (!$createUser) {

            throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('api . commons . reject'));

        }

        $this->groupUserModel->create(['group_id' => $useRole,
            'user_id' => $createUser->id]);

    }


    public function update($id, UserEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api . commons . reject'));

        $useRole = $entity->groupId;
        unset($entity->groupId);

        $this->model->where('id', $id)->update($entity->getArray());
        $oldRole = $this->groupUserModel->where('user_id', $useRole)->get();

        if ($useRole != $oldRole[0]->id) {
            $this->groupUserModel->where('user_id', $id)->update(['group_id' => $useRole]);
        }

    }

    /**
     * edit function
     * @method : DELETE with params ID
     * @param $id
     */
    public function delete($id)
    {

        $deleteById = $this->model->find($id);

        if (is_null($deleteById)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api . commons . reject'));

        $this->model->destroy($id);


    }

    public function getInsertId()
    {
        return $this->model->latest('id')->first()->id;
    }

    public function getCountItems()
    {
        return $this->model->count();
    }
}
