<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('auth_permissions')->insertBatch([[
            'name' => 'user',
            'description' => 'manage user',
            'active'=>0
        ], [
            'name' => 'setting',
            'description' => 'manage setting',
            'active'=>0
        ]]);

    }
}
