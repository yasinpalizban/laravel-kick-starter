<?php namespace App\Filters;

use App\Libraries\QueryFilter;

class  PermissionGroupFilter extends QueryFilter
{

    protected $safeParms = [
        'id' => ['eq', 'ne'],
        'group_id' => ['eq', 'ne'],
        'permission_id' => ['eq', 'ne'],
        'actions' => ['eq', 'ne', 'lik'],
    ];
    protected $cloumnMap = [
        'groupId' => 'group_id',
        'permissionId' => 'permission_id',
    ];
}
