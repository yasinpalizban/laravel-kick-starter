<?php namespace App\Filters;

use App\Libraries\QueryFilter;

class  PermissionUserFilter extends QueryFilter
{

    protected $safeParms = [
        'id' => ['eq','ne'],
        'user_id' => ['eq','ne'],
        'permission_id' => ['eq','ne'],
        'actions' => ['eq','ne','lik'],
    ];
    protected $cloumnMap=[
        'userId' =>  'user_id',
        'permissionId' => 'permission_id',

    ];

}
