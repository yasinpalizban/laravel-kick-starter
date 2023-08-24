<?php namespace App\Entities;


use App\Libraries\Entity;

class  PermissionEntity extends Entity
{

    public $id;
    public $name;
    public $description;
    public $active;


    public function __construct($attributes)
    {
        $this->fill($this, $attributes);



    }

    protected $datamap = [
    ];



}
