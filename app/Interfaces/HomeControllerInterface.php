<?php

namespace App\Interfaces;


use App\Services\HomeService;
use Illuminate\Http\Request;

interface HomeControllerInterface
{

    public function settings(Request $request, HomeService $homeService);



}
