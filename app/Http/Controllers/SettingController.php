<?php

namespace App\Http\Controllers;

use App\Entities\SettingEntity;
use App\Filters\SettingFilter;
use App\Services\SettingService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class SettingController extends ApiController
{

    public function index(Request $request, SettingService $settingService)
    {


        $settingFilter = new SettingFilter();
        $settingFilter->transform($request)->navigation($request);
        $data = $settingService->index($settingFilter);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function show($id, SettingService $settingService)
    {
        $data = $settingService->show($id);

        return response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function store(Request $request, SettingService $settingService)
    {
        $rules = [
            'key' => 'required|min:3|max:255|unique:App\Models\SettingModel,key',
            'value' => 'required|max:255',
            'description' => 'required|min:3|max:255',
            'status' => 'required',
        ];

        $fields = $request->validate($rules);

        $settingEntity = new SettingEntity($fields);
        $settingEntity->createdAt();

        $settingService->create($settingEntity);

        return response([])->setStatusCode(ResponseAlias::HTTP_CREATED, __('api.commons.save'));

    }


    public function update(Request $request, $id, SettingService $settingService)
    {


        $rules = [
            'key' => 'nullable|min:3|max:255',
            'value' => 'required|max:255',
            'description' => 'required|min:3|max:255',
            'status' => 'required'
        ];

        $fields = $request->validate($rules);

        $settingEntity = new SettingEntity($fields);
        $settingEntity->updatedAt();

        $settingService->update($id, $settingEntity);

        return response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.update'));

    }

    public function destroy($id, SettingService $settingService)
    {
        $settingService->delete($id);
        return response([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.remove'));

    }


}
