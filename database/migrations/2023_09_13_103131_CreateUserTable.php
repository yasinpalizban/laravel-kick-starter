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
        Schema::create('users', function (Blueprint $table) {
            $table->integer('id')->unsigned()->autoIncrement();
            $table->string('username',300)->unique();
            $table->string('phone',300)->unique();
            $table->string('email',300)->unique();
            $table->string('password',300);
            $table->string('reset_token',300);
            $table->dateTime('reset_at');
            $table->dateTime('reset_expires');
            $table->string('active_token',300);
            $table->boolean('active');
            $table->date('active_expires');
            $table->boolean('status');
            $table->string('status_message',300);
            $table->dateTime('created_at');
            $table->dateTime('updated_at');
            $table->dateTime('deleted_at');
            $table->string('first_name',300);
            $table->string('last_name',300);
            $table->string('image',300);
            $table->set('gender', ['male', 'female']);
            $table->date('birthday');
            $table->string('country',300);
            $table->string('city',300);
            $table->string('address',300);
            $table->string('title',300);
            $table->text('bio');

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
