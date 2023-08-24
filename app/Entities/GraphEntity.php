<?php namespace App\Entities;



use App\Libraries\Entity;

class  GraphEntity extends Entity
{



    protected $type;
    protected $fromDate;
    protected $toDate;
    public function __construct($attributes)
    {
        $this->fill($this, $attributes);



    }
    protected $datamap = [
        'fromDate' => 'from_date',
        'toDate' => 'to_date',

    ];


}
