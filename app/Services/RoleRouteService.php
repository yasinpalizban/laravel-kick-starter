<?php

namespace App\Services;

use App\Enums\RoleType;

class RoleRouteService
{
    public function getRoleAccess(string $name): ?array
    {

        // you can assess this controller after sign in
        // could has role or not
        $controllerRoles = array(

            'profile' => null,
            'overView' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],
            'graph' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],



            'user' => [RoleType::Admin],
            'group' => [RoleType::Admin],
            'permission' => [RoleType::Admin],
            'permissionUser' => [RoleType::Admin],
            'permissionGroup' => [RoleType::Admin],

            'setting' => [RoleType::Admin],
            'visitor' => [RoleType::Admin, RoleType::Coworker],




        );

        foreach ($controllerRoles as $key => $value) {
            if ($key == $name) {
                return $value;
            }
        }
        return null;
    }

    public function ignoreRoute(string $routeName): bool
    {
        // you can assess this controller with out sign in


        $ignoreRestFullRoutes = [
            'home',
            'msc',
            'test'
        ];


        foreach ($ignoreRestFullRoutes as $item) {
            if ($item == $routeName) {
                return true;
            }
        }


        return false;
    }


}
