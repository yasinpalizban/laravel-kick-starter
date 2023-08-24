<?php

namespace Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;


class GroupUserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'user_id' => 1,
            'group_id' => 1,
        ];
    }



}
