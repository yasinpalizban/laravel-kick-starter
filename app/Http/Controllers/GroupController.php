<?php

namespace App\Http\Controllers;
use App\Entities\GroupEntity;
use App\Filters\GroupFilter;
use App\Services\GroupService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class GroupController extends ApiController
{

    public function index(Request $request, GroupService $groupService)
    {

        $groupFilter =  new GroupFilter();

        $groupFilter->transform($request)->navigation($request);

        $data= $groupService->index($groupFilter);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function show($id, GroupService $groupService)
    {
        $data =$groupService->show($id);

        return  response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }
    public function store(Request $request, GroupService $groupService)
    {
        $rules = [
            'name' => 'required|min:3|max:255|unique:App\Models\GroupModel,name',
            'description' => 'required|min:3|max:255',

        ];

        $fields=$request->validate($rules);

        $groupEntity = new GroupEntity($fields);

        $groupService->create($groupEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_CREATED, __('api.commons.save'));

    }


    public function update(Request $request, $id, GroupService $groupService)
    {



        $rules = [
            'name' => 'nullable|min:3|max:255|unique:App\Models\GroupModel,name',
            'description' => 'required|min:3|max:255',

        ];

        $fields=$request->validate($rules);

        $groupEntity = new GroupEntity($fields);

        $groupService->update($id, $groupEntity);

        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.update'));

    }

    public function destroy($id,  GroupService $groupService)
    {
        $groupService->delete($id);
        return  response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.remove'));

    }


}
