<?php

namespace App\Http\Controllers;

use App\Config\AppConfig;
use App\Entities\UserEntity;
use App\Services\ProfileService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

;

class ProfileController extends ApiController
{

    public function index(Request $request, ProfileService $profileService)
    {
        $user = json_decode($request->request->get('user'));

        $data = $profileService->show($user->id);
        return Response()->json($data)->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }

    public function store(Request $request, ProfileService $profileService)
    {
        $user = json_decode($request->request->get('user'));

        $customConfig = new AppConfig();


        $rules = [


            'firstName' => 'nullable|max:255',
            'lastName' => 'nullable|max:255',
            'bio' => 'nullable|max:500',
            'title' => 'nullable|max:255',
            'address' => 'nullable|max:255',
            'phone' => 'nullable|max:11',
            'password' => 'nullable|min:6|required_with:passwordConfirm|same:passwordConfirm',
            'passwordConfirm' => 'nullable',
            'gender' => 'nullable|max:255',
            'country' => 'nullable|max:255',
            'city' => 'nullable|max:255',
            'image' => 'nullable|mimes:png,jpg,jpeg,webp|max:4096',

        ];
        $fields = $request->validate($rules);

        $userEntity = new UserEntity($fields);


        if (isset($_FILES['image'])) {
            $avatar = $request->file('image');
            $fileName = time() . '.' . $avatar->getClientOriginalExtension();
            $filePath = $avatar->storeAs($customConfig->profileDirectory, $fileName);
            $userEntity->image = $filePath;
        }

        $profileService->update($user->id, $userEntity);

        return response()->json([])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.save'));

    }


}
