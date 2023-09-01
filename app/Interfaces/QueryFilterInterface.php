<?php

namespace App\Interfaces;


use Illuminate\Http\Request;

interface QueryFilterInterface
{

    public function transform(Request $request);

    public function navigation(Request $request);
}
