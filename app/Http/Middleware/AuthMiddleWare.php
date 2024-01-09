<?php

namespace App\Http\Middleware;

use App\Config\AuthConfig;
use App\Enums\FilterErrorType;
use App\Models\GroupModel;
use App\Models\GroupUserModel;
use App\Models\PermissionGroupModel;
use App\Models\PermissionModel;
use App\Models\PermissionUserModel;
use App\Models\UserModel;
use Closure;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class AuthMiddleWare
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {


        $groupsUsersModel = new GroupUserModel();
        $permissionGroupModel = new PermissionGroupModel();
        $permissionUserModel = new PermissionUserModel();
        $permissionModel = new PermissionModel();
        $groupModel = new GroupModel();
        $userModel = new UserModel();
        $authConfig = new  AuthConfig();
        $controllerName = routeController( $request->getPathInfo());


        try {
            $authorization = $request->Server('HTTP_AUTHORIZATION') ? getJWTHeader($request->Server('HTTP_AUTHORIZATION')) : $request->Cookie($authConfig->jwt['name']);

            if (is_null($authorization)) {
                return response()->json([
                    'type' => FilterErrorType::Login,
                    'error' => __('middleWear.authToken')])
                    ->setStatusCode(ResponseAlias::HTTP_UNAUTHORIZED, __('middleWear.authToken'));
            }

            $jwtUser = validateJWT($authorization, $authConfig->jwt['secretKey']);

            $findUser = $userModel->where('id', $jwtUser->userId)->first();

            if (is_null($findUser)) {

                return response()->json(['success' => false,
                    'type' => FilterErrorType::Login,
                    'error' => __('middleWear.wrongAuth')])
                    ->setStatusCode(ResponseAlias::HTTP_UNAUTHORIZED, __('middleWear.wrongAuth'));

            }

            $userGroup = $groupModel->getGroupsForUser($jwtUser->userId);
            $findUser->groupId = $userGroup[0]->id;
            $findUser->groupName = $userGroup[0]->name;
            $request->request->add(['user' => $findUser]);

            $permission = $permissionModel->where(["name" => $controllerName,])->first();
            $permissionGroup = $permissionGroupModel->where([
                "permission_id" => $permission->id,
                "group_id" => $userGroup[0]->id
            ])->first();


            if ($permission->active ==false) {
                if (!empty($permissionGroup)) {
                    return $next($request);
                }

            } else {

                $typeMethod = strtolower($request->getMethod());
                $permissionUser = $permissionUserModel->where([
                    "permission_id" => $permission->id,
                    "user_id" => $findUser->id])->
                first();


                if (!empty($permissionGroup) && strstr($permissionGroup->actions, $typeMethod)) {

                    return $next($request);

                }

                if (!empty($permissionUser) && strstr($permissionUser->actions, $typeMethod)) {

                    return $next($request);
                }

            }

            return response()->json([
                'type' => FilterErrorType::Permission,
                'error' => __('middleWear.notEnoughPrivilege')])
                ->setStatusCode(ResponseAlias::HTTP_UNAUTHORIZED, __('middleWear.notEnoughPrivilege'));


        } catch (\Exception $e) {

            return response()->json([
                'type' => FilterErrorType::Login,
                'error' => __('middleWear.wrongAuth')])
                ->setStatusCode(ResponseAlias::HTTP_UNAUTHORIZED, __('middleWear.wrongAuth'));


        }


    }
}
