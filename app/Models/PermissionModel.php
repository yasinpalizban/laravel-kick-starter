<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PermissionModel extends  Model
{

    protected $table = 'auth_permissions';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'description',
        'active'
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

    function permissionGroup()
    {
        $this->hasMany(PermissionGroupModel::class,'permission_id','id');
    }

    function permissionUser()
    {
        $this->hasMany(PermissionUserModel::class,'permission_id','id');
    }

}
