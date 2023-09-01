<?php namespace App\Filters;

use App\Libraries\QueryFilter;

class  PermissionFilter extends QueryFilter
{

    protected $safeParms = [
        'id' => ['eq','ne'],
        'name' => ['eq', 'ne','lik'],
        'description' => ['eq','ne','lik'],
        'active' => ['eq','ne','lik'],
    ];

}
