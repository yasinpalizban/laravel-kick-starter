<?php

namespace App\Http\Controllers;



use App\Interfaces\HomeControllerInterface;
use App\Services\HomeService;
use Illuminate\Http\Request;
use Pusher\Pusher;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class HomeController extends BaseController implements HomeControllerInterface
{

  public function index(Request $request){
      return Response()->json(['home'])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));
  }



    public function settings(Request $request, HomeService $homeService)
    {

        $data = $homeService->settings();

        return Response()->json(['settingPost' => $data])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));


    }



}




