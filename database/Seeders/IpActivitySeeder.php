<?php

namespace Database\Seeders;

use App\Models\IpActivityModel;
use Illuminate\Database\Seeder;

class IpActivitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        IpActivityModel::factory()
        ->count(20)
        ->create();
    }
}
