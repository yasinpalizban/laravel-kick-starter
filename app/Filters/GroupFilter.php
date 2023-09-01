<?php namespace App\Filters;

use App\Libraries\QueryFilter;

class  GroupFilter extends QueryFilter
{

    protected $safeParms = [
        'id' => ['eq','ne'],
        'name' => ['eq', 'ne','lik'],
        'description' => ['eq','ne','lik']
    ];

}
