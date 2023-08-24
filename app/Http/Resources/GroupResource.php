<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GroupResource extends JsonResource
{


    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     **/
    public function toArray($request)
    {


        $data = [];
        $classObjects = [
            'id' => 'id',
            'name' => 'name',
            'description' => 'description',

        ];
        foreach ($classObjects as $key => $value) {
            if ($this->$value) {
                $data[$key] = $this->$value;
            }
        }

        return $data;

    }
}
