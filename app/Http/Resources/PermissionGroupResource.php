<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PermissionGroupResource extends JsonResource
{


    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     **/
    public function toArray($request)
    {

        return [
            'id' => $this->id,
            'groupId' => $this->group_id,
            'permissionId' => $this->permission_id,
            'group' => $this->group,
            'permission' => $this->permission,
            'actions' => $this->actions,

        ];

    }
}
