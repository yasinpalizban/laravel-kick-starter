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

        return [
            'id' => $this->id,
            'username' => $this->username,
            'phone' => $this->phone,
            'email' => $this->email,
            'gender' => $this->gender,
            'firstName' => $this->first_name,
            'lastName' => $this->last_name,
            'country' => $this->country,
            'city' => $this->city,
            'address' => $this->address,
            'image' => fixUrlFile($this->resource->image),
            'birthday' => $this->birthday,
            'bio' => $this->bio,
            'title' => $this->title,
            'status' => $this->status,
            'statusMessage' => $this->status_message,
            'active' => $this->active,
            'createdAt' => $this->created_at,
            'updatedAt' => $this->updated_at,
            'deletedAt' => $this->deleted_at
        ];

    }
}
