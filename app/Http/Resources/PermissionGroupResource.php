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

        $data = [];
        $classObjects = [
            'id' => 'id',
            'groupId' => 'group_id',
            'permissionId' => 'permission_id',
            'group' => 'group',
            'permission' => 'permission',
            'actions' => 'actions',

        ];
        foreach ($classObjects as $key => $value) {
            if (!empty($this->$value)) {
                $data[$key] = $this->$value;
            }
        }

        return $data;

    }
}
