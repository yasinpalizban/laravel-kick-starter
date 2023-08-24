<?php

namespace App\Http\Controllers;
use App\Entities\PermissionGroupEntity;
use App\Libraries\UrlAggregation;
use App\Services\PermissionGroupService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class PermissionGroupController extends ApiController
{

    public function index(Request $request, PermissionGroupService $permissionGroupService,int $permission_id=0)
    {

        $urlAggregation= new UrlAggregation($request);
        $groupsPermissionEntity = new PermissionGroupEntity(null);
        $urlAggregation->dataMap($groupsPermissionEntity->getDataMap());

        $data= $permissionGroupService->setNestId($permission_id)->index($urlAggregation);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function show($id,PermissionGroupService $permissionGroupService)
    {
        $data =$permissionGroupService->show($id);

        return  response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }
    public function store(Request $request, PermissionGroupService $permissionGroupService)
    {
        $rules = [
            'groupId' => 'required',
            'permissionId' => 'required',
            'actions' => 'required|min:3|max:255',

        ];

        $fields=$request->validate($rules);

        $permissionGroupEntity = new PermissionGroupEntity($fields);

        $permissionGroupService->create($permissionGroupEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_CREATED, __('api.commons.save'));

    }


    public function update(Request $request, $id, PermissionGroupService $permissionGroupService)
    {



        $rules = [
            'groupId' => 'required',
            'permissionId' => 'required',
            'actions' => 'required|min:3|max:255',

        ];

        $fields=$request->validate($rules);

        $permissionGroupEntity = new PermissionGroupEntity($fields);


        $permissionGroupService->update($id, $permissionGroupEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.update'));

    }

    public function destroy($id,  PermissionGroupService $permissionGroupService)
    {
        $permissionGroupService->delete($id);
        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.remove'));

    }


}
