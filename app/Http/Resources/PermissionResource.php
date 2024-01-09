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



        return [
            'id' => $this->id,
            'name' => $this->name,
            'active' => $this->active,
            'description' => $this->description,
            // 'permissionUser'=>PermissionUserResource::collection($this->whenLoaded('permissionUser'))

        ];

    }
}
