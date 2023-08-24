<?php

namespace App\Services;

use App\Entities\GraphEntity;
use App\Libraries\MainService;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;


class GraphService extends MainService
{


    public function __construct()
    {
        parent::__construct();

    }

    public function index()
    {
         $today = date('Y-m-d', time());
          $lastWeek = date("Y-m-d", (time() - (60 * 60 * 24 * 7)));
          $lastMonth = date("Y-m-d", (time() - (60 * 60 * 24 * 30)));

        return [['name'=>'x' ,'value'=>10]];


    }

    public function create(GraphEntity $graphEntity)
    {

        $today = date('Y-m-d', time());
        $lastWeek = date("Y-m-d", (time() - (60 * 60 * 24 * 7)));
        $lastMonth = date("Y-m-d", (time() - (60 * 60 * 24 * 30)));

        return [['name'=>'x' ,'value'=>10]];
    }

}
