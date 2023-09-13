<?php

namespace Database\Factories;

use App\Models\IpActivityModel;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class IpActivityFactory extends Factory
{

    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */

    protected $model = IpActivityModel::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'login' => fake()->name(),
            'success' => fake()->boolean,
            'ip_address' => fake()->ipv4,
            'user_agent' => fake()->userAgent,
            'date' => fake()->dateTime,
        ];
    }



}
