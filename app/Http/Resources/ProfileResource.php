<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProfileResource extends JsonResource
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
            'username' => 'username',
            'phone' => 'phone',
            'email' => 'email',
            'gender' => 'gender',
            'firstName' => 'first_name',
            'lastName' => 'last_name',
            'country' => 'country',
            'city' => 'city',
            'address' => 'address',
            'image' => 'image',
            'birthday' => 'birthday',
            'bio' => 'bio',
            'title' => 'title',
            'status' => 'status',
            'statusMessage' => 'status_message',
            'active' => 'active',
            'createdAt' => 'created_at',
            'updatedAt' => 'updated_at',
            'deletedAt' => 'deleted_at'

        ];

        foreach ($classObjects as $key => $value) {
            if (isset($this->resource->$value) ) {
                $data[$key] = $this->resource->$value;
            }
        }

        if (isset($this->resource->image)) {
            $arr = explode('/', $this->image);
            $arr[0] = getenv('APP_ENV')=="local" ? 'storage': 'storage/app/'.$arr[0];
            $temp = implode('/', $arr);
            $data['image'] = $temp;
        }
        return $data;

    }
}
