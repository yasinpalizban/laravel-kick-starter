<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('auth_groups_users')
            ->insertBatch([[
                'user_id' => 1,
                'permission_id' => 2,
                'actions' => '-get-post-put-delete'
            ]]);


    }
}
