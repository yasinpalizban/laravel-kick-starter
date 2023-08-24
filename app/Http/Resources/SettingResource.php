<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SettingResource extends JsonResource
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
            'key' => 'key',
            'value' => 'value',
            'status' => 'status',
            'description' => 'description',
            'createdAt' => 'created_at',
            'updatedAt' => 'updated_at',
            'deletedAt' => 'deleted_at'

        ];
        foreach ($classObjects as $key => $value) {
            if (isset($this->resource->$value) ) {
                $data[$key] = $this->resource->$value;
            }
        }

        return $data;
////return parent::toArray($request);
    }
}
