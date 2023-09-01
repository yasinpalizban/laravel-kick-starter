<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PermissionUserModel extends  Model
{

    protected $table = 'auth_users_permissions';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
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


    public function user()
    {
        return $this->hasMany(UserModel::class,'id','user_id');
    }


    public function permission()
    {
        return $this->hasMany(PermissionModel::class,'id','permission_id');
    }

    public function permissionsOfUser(string $userId)
    {

        return $this
            ->select(['auth_users_permissions.id',
            'auth_users_permissions.user_id as userId',
            'auth_users_permissions.permission_id as permissionId',
           'auth_users_permissions.actions',
             'auth_permissions.name as permission'])
            ->join('auth_permissions', 'auth_permissions.id', '=' ,'auth_users_permissions.permission_id')
            ->where('auth_users_permissions.user_id', $userId);



    }


}
