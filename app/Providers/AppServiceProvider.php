<?php

namespace App\Providers;

use App\Services\AuthService;
use App\Services\GraphService;
use App\Services\GroupService;
use App\Services\HomeService;
use App\Services\PermissionGroupService;
use App\Services\PermissionService;
use App\Services\PermissionUserService;
use App\Services\ProfileService;

use App\Services\SettingService;
use App\Services\UserService;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
        $this->app->bind(GraphService::class, function ($app) {
            return new GraphService();
        });




        $this->app->bind(AuthService::class, function ($app){
            return new AuthService();
        });

        $this->app->bind(GroupService::class, function ($app){
            return new GroupService();
        });


        $this->app->bind(PermissionService::class, function ($app){
            return new PermissionService();
        });


        $this->app->bind(PermissionUserService::class, function ($app){
            return new PermissionUserService();
        });

        $this->app->bind(PermissionGroupService::class, function ($app){
            return new PermissionGroupService();
        });

        $this->app->bind(SettingService::class, function($app){
            return new SettingService();
        });
        $this->app->bind(ProfileService::class, function($app){
            return new ProfileService();
        });

        $this->app->bind(UserService::class, function($app){
            return new UserService();
        });




        $this->app->bind(HomeService::class, function($app){
            return new HomeService();
        });

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
