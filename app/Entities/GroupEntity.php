<?php namespace App\Entities;



use App\Libraries\Entity;

class  GroupEntity extends Entity
{

    public $id;
    public $name;
    public $description;

    public function __construct($attributes)
    {
        $this->fill($this, $attributes);



    }


    protected $datamap = [
    ];





}
