<?php namespace App\Filters;

use App\Libraries\QueryFilter;

class  UserFilter extends QueryFilter
{

    protected $safeParms = [
        'id' => ['eq','ne'],
        'username'=>['eq','ne','lik'],
        'email'=>['eq','ne','lik'],
        'phone'=>['eq','ne','lik'],
        'password'=>['eq','ne','lik'],
        'reset_token'=>['eq','ne','lik'],
        'reset_at'=>['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'reset_expires'=>['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'active'=>['eq','ne','lik'],
        'active_token'=>['eq','ne','lik'],
        'active_expires'=>['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'status'=>['eq','ne'],
        'status_message'=>['eq','ne','lik'],
        'created_at'=>['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'updated_at'=>['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'deleted_at'=>['eq', 'ne', 'gte', 'gt', 'lte', 'lt'],
        'first_name'=>['eq','ne','lik'],
        'last_name'=>['eq','ne','lik'],
        'image'=>['eq','ne','lik'],
        'gender'=>['eq','ne'],
        'birthday'=>['eq','ne','lik'],
        'country'=>['eq','ne','lik'],
        'city'=>['eq','ne','lik'],
        'address'=>['eq','ne','lik'],
        'title'=>['eq','ne','lik'],
        'bio'=>['eq','ne','lik'],
        'name'=>['eq','ne','lik'],


    ];
    protected $cloumnMap = [

        'createdAt' => 'created_at',
        'updatedAt' => 'updated_at',
        'deletedAt' => 'deleted_at',
        'firstName'=>'first_name',
        'lastName'=>'last_name',
        'activeToken'=> 'active_token',
        'activeExpires'=>'active_expires',
        'statusMessage'=>'status_message',
        'resetToken'=>'reset_token',
        'resetAt'=>'reset_token',
        'resetExpires'=>'reset_expires',
    ];

}
