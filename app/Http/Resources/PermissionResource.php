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
            'name' => 'name',
            'active' => 'active',
            'description' => 'description',
           // 'permissionUser'=>PermissionUserResource::collection($this->whenLoaded('permissionUser'))

        ];
        foreach ($classObjects as $key => $value) {
            if (isset($this->resource->$value) ) {
                $data[$key] = $this->$value;
            }
        }

        return $data;

    }
}
