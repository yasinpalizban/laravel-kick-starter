<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class GroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('auth_groups')->insert([[
            'id'=>1,
            'name' => 'admin',
            'description' => 'admin'
        ], [
            'id'=>2,
            'name' => 'coworker',
            'description' => 'coworker'
        ], [
            'id'=>3,
            'name' => 'blogger',
            'description' => 'blogger'
        ], [
            'id'=>4,
            'name' => 'member',
            'description' => 'member'
        ]]);



    }
}
