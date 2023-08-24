<?php namespace App\Entities;


use App\Libraries\Entity;

class  PermissionUserEntity extends Entity
{

    public $userId;
    public $permissionId;
    public $actions;


    public function __construct($attributes)
    {
        $this->fill($this, $attributes);



    }
    protected $datamap = [
        'userId'=>'user_id' ,
        'permissionId'=>'permission_id' ,
    ];





}
