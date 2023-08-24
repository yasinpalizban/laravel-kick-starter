<?php

namespace App\Http\Controllers;
use App\Entities\PermissionEntity;
use App\Libraries\UrlAggregation;
use App\Services\PermissionService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class PermissionController extends ApiController
{

    public function index(Request $request, PermissionService $permissionService)
    {

        $urlAggregation= new UrlAggregation($request);
        $permissionEntity = new PermissionEntity(null);
        $urlAggregation->dataMap($permissionEntity->getDataMap());
        $data= $permissionService->index($urlAggregation);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function show($id, PermissionService $permissionService)
    {
        $data =$permissionService->show($id);

        return  response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }
    public function store(Request $request, PermissionService $permissionService)
    {
        $rules = [

            'description' => 'required|min:3|max:255',
            'name' => 'required|min:3|max:255|unique:Modules\Auth\Models\PermissionModel,name',
            'active'=>'required'
        ];

        $fields=$request->validate($rules);

        $permissionEntity = new PermissionEntity($fields);


        $permissionService->create($permissionEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_CREATED, __('api.commons.save'));

    }


    public function update(Request $request, $id, PermissionService $permissionService)
    {



        $rules = [
            'description' => 'required|min:3|max:255',
            'name' => 'nullable|min:3|max:255|unique:Modules\Auth\Models\PermissionModel,name',
            'active'=>'required'
        ];

        $fields=$request->validate($rules);

        $permissionEntity = new PermissionEntity($fields);


        $permissionService->update($id, $permissionEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.update'));

    }

    public function destroy($id,  PermissionService $permissionService)
    {
        $permissionService->delete($id);
        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.remove'));

    }


}
