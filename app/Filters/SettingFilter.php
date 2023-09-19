<?php namespace App\Filters;

use App\Libraries\QueryFilter;

class  SettingFilter extends QueryFilter
{

    protected $safeParms = [
        'id' => ['eq', 'ne'],
        'key' => ['eq', 'ne','lik'],
        'value' => ['eq', 'ne','lik'],
        'description' => ['eq', 'ne','lik'],
        'status' => ['eq', 'ne'],
        'createdAt' => ['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'updatedAt' => ['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'deletedAt' => ['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
    ];

    protected $cloumnMap = [
        'createdAt' => 'created_at',
        'updatedAt' => 'updated_at',
        'deletedAt' => 'deleted_at',
    ];

}
