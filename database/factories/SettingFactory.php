<?php

namespace Database\Factories;

use App\Models\SettingModel;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class SettingFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model =SettingModel::class;


    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'key' => fake()->name(),
            'value' => fake()->name(),
            'description' => fake()->text,
            'status' => fake()->boolean,
            'created_at' => fake()->dateTime,
        ];
    }



}
