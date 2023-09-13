<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GroupUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('auth_groups_users')
            ->insert([
                'id'=>1,
                'group_id' => '1',
                'user_id' => '1'
            ]);
    }
}
