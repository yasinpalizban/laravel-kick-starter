<?php

namespace Database\Migrations;

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('auth_logins', function (Blueprint $table) {
            $table->integer('id')->unsigned()->autoIncrement();
            $table->string('ip_address',300);
            $table->string('login',300);
            $table->string('success',300);
            $table->integer('user_id')->unsigned();
           $table->string('type',300)->nullable();
           $table->string('user_agent',300)->nullable();
            $table->dateTime('date');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}

;
