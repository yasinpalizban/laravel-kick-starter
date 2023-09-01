<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PermissionGroupModel extends  Model
{

    protected $table = 'auth_groups_permissions';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'group_id',
        'permission_id',
        'actions'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [

    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [

    ];

    /**
     * The model's default values for attributes.
     *
     * @var array
     */
    protected $attributes = [

    ];


    public function group()
    {
        return $this->hasMany(GroupModel::class,'id','group_id');
    }


    public function permission()
    {
        return $this->hasMany(PermissionModel::class,'id','permission_id');
    }


    public function permissionsOfGroup(string $groupId)
    {

        $this->table = 'auth_groups_users';
        return $this->select([
            'auth_groups_permissions.id',
            'auth_groups_permissions.group_id as groupId',
            'auth_groups_permissions.permission_id as permissionId',
            'auth_groups_permissions.actions',
            'auth_permissions.name as permission'
        ])
            ->join('auth_groups_permissions', 'auth_groups_permissions.group_id', '=', 'auth_groups_users.group_id')
            ->join('auth_permissions', 'auth_permissions.id', '=', 'auth_groups_permissions.permission_id')
            ->where('auth_groups_permissions.group_id', $groupId);
    }

}
