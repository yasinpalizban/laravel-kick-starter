<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('auth_groups_permissions')->insertBatch([[
            'group_id' => 1,
            'permission_id' => 1,
            'action' => '-get-post-put-delete'
        ]]);;
    }
}
