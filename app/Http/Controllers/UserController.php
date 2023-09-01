<?php

namespace App\Http\Controllers;

use App\Entities\UserEntity;
use App\Filters\UserFilter;
use App\Services\UserService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class UserController extends ApiController
{

    public function index(Request $request, UserService $userService)
    {

        $userFilter = new UserFilter();
        $userFilter->transform($request)->navigation($request);
        $data = $userService->index($userFilter);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function show($id, UserService $userService)
    {
        $data = $userService->show($id);

        return response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function store(Request $request, UserService $userService)
    {


        $rules = [
            'username' => 'required|alpha_num|min:3|unique:Modules\Auth\Models\UserModel,username',
            'email' => 'required|email:rfc,dns|unique:Modules\Auth\Models\UserModel,email',
            'phone' => 'required|max:11|unique:Modules\Auth\Models\UserModel,phone',
            'password' => 'required',
            'firstName' => 'nullable|alpha|max:255',
            'lastName' => 'nullable|alpha|max:255',
            'groupId' => 'required',
        ];

        $fields = $request->validate($rules);

        $userEntity = new UserEntity($fields);
        $userEntity->createdAt()->activate()->disableStatus()->generatePassword();


        $userService->create($userEntity);

        return response([])->setStatusCode(ResponseAlias::HTTP_CREATED, __('api.commons.save'));

    }


    public function update(Request $request, $id, UserService $userService)
    {


        $rules = [

            'firstName' => 'nullable|alpha|max:255',
            'lastName' => 'nullable|alpha|max:255',
            'groupId' => 'required',
            'status' => 'required',
        ];

        $fields = $request->validate($rules);

        $userEntity = new UserEntity($fields);
        $userEntity->updatedAt();


        $userService->update($id, $userEntity);

        return response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.update'));

    }

    public function destroy($id, UserService $userService)
    {
        $userService->delete($id);
        return response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.remove'));

    }


}
