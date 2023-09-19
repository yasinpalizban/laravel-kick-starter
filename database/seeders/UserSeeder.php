<?php

namespace Database\Seeders;

use App\Config\AuthConfig;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $authConfig = new AuthConfig();
        DB::table('users')->insert([
            'username' => 'admin',
            'email' => 'admin@admin.com',
            'phone' => '0918000',
            "active" => "1",
            "password" => '$2y$10$7i2pxCY7hvp7BQfpkVAXgulJkC/f8i1g71YQ/TRBuJvhPsKLAsAt6',
            "image" => $authConfig->defualtUserProfile,
            "first_name"=>"admin",
            "last_name"=>"admin",
        ]);
    }
}
