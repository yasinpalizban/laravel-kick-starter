<?php

namespace App\Http\Controllers;

use App\Entities\GraphEntity;
use App\Services\GraphService;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class GraphController extends Controller
{

    public function index(Request $request,GraphService $graphService)
    {
        $data = $graphService->index();
        return Response()->json(['data'=>$data])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.receive'));
    }
    public function store(Request $request, GraphService $graphService)
    {


        $rules = [
            'type' => 'required',
            'fromDate' => 'required',
            'toDate' => 'required',
        ];

        $fields=$request->validate($rules);


        $graphEntity = new GraphEntity($fields);


        $data = $graphService->create($graphEntity);



        return Response()->json( ['data' => $data])->setStatusCode(ResponseAlias::HTTP_OK, __('api.commons.save'));
    }

}
