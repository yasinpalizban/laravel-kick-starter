<?php
namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\JsonResource;

class PermissionUserResource  extends JsonResource
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
            'userId' => 'user_id',
            'permissionId' => 'permission_id',
            'actions' => 'actions',
            'permission' => 'permission',
            'username' => 'username',
            'firstName' => 'firstName',
            'lastName' => 'lastName',

        ];
        foreach ($classObjects as $key => $value) {
            if (isset($this->resource->$value) ) {
                $data[$key] = $this->$value;
            }
        }

        return $data;

    }
}
