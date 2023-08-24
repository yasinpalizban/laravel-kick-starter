<?php namespace App\Entities;



use App\Libraries\Entity;

class  PermissionGroupEntity extends Entity
{

    public $Id;
    public $groupId;
    public $permissionId;
    public $actions;


    public function __construct($attributes)
    {
        $this->fill($this, $attributes);



    }
    protected $datamap = [
        'groupId'=>'group_id' ,
        'permissionId'=>'permission_id' ,
    ];




}
