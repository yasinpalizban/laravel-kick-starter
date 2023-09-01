<?php

namespace App\Http\Controllers;

use App\Filters\UserFilter;
use App\Services\UserService;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class OverViewController extends ApiController
{

    public function index(Request $request, UserService $userService,)
    {

        $userFilter = new UserFilter();
        $userFilter->navigation($request);
        return Response()->json([


            'userPost' => toObject($userService->index($userFilter)),
            'countPost' => [
                'users' => $userService->getCountItems(),
            ]])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }


}
