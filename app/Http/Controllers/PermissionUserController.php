<?php

namespace App\Http\Controllers;
use App\Entities\PermissionUserEntity;

use App\Filters\PermissionUserFilter;
use App\Services\PermissionUserService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class PermissionUserController extends ApiController
{

    public function index(Request $request, PermissionUserService $permissionUserService, int $permission_id=0)
    {

        $permissionUserFilter = new PermissionUserFilter();
        $permissionUserFilter->transform($request)->navigation($request);
        $data= $permissionUserService->setNestId($permission_id)->index($permissionUserFilter);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function show($id, PermissionUserService $permissionUserService)
    {
        $data =$permissionUserService->show($id);

        return  response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }
    public function store(Request $request, PermissionUserService $permissionUserService)
    {
        $rules = [
            'userId' => 'required',
            'permissionId' => 'required',
            'actions' => 'required|min:3|max:255',

        ];

        $fields=$request->validate($rules);

        $permissionUserEntity = new PermissionUserEntity($fields);


        $permissionUserService->create($permissionUserEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_CREATED, __('api.commons.save'));

    }


    public function update(Request $request, $id, PermissionUserService $permissionUserService)
    {



        $rules = [
            'userId' => 'required',
            'permissionId' => 'required',
            'actions' => 'required|min:3|max:255',
        ];

        $fields=$request->validate($rules);

        $permissionUserEntity = new PermissionUserEntity($fields);

        $permissionUserService->update($id, $permissionUserEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.update'));

    }

    public function destroy($id,  PermissionUserService $permissionUserService)
    {
        $permissionUserService->delete($id);
        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.remove'));

    }


}
