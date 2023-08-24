<?php

namespace App\Http\Controllers;

use App\Libraries\UrlAggregation;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class OverViewController extends Controller
{

    public function index(Request $request , UserService $userService,)
    {
       $urlAggregation=  new UrlAggregation($request);


        return Response()->json([


           'userPost' => toObject($userService->index($urlAggregation)->getIterator()),
            'countPost' => [
                'users' => $userService->getCountItems(),
            ]])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }






}
