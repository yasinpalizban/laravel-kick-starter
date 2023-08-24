<?php
namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\JsonResource;

class PermissionResource  extends JsonResource
{


    /**
     * Transform the resource into an array.
     *
     *  @param  \Illuminate\Http\Request  $request
     *  @return array
     **/
    public function toArray($request)
    {

        $data = [];
        $classObjects = [
            'id' => 'id',
            'key' => 'key',
            'value' => 'value',
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
