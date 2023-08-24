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

            'chatContact' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],
            'chatRoom' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],
            'chatRoomMedia' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],
            'chatPrivate' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],
            'chatPrivateMedia' => [RoleType::Admin, RoleType::Coworker, RoleType::Blogger],


            'user' => [RoleType::Admin],
            'group' => [RoleType::Admin],
            'permission' => [RoleType::Admin],
            'usersPermission' => [RoleType::Admin],
            'groupsPermission' => [RoleType::Admin],

            'setting' => [RoleType::Admin],
            'visitor' => [RoleType::Admin, RoleType::Coworker],

            'advertisement' => [RoleType::Admin, RoleType::Coworker],
            'advertisementMedia' => [RoleType::Admin, RoleType::Coworker],

            'contact' => [RoleType::Admin, RoleType::Coworker],
            'contactMedia' => [RoleType::Admin, RoleType::Coworker],

            'newsCategory' => [RoleType::Admin, RoleType::Blogger],
            'newsSubCategory' => [RoleType::Admin, RoleType::Blogger],
            'newsPost' => [RoleType::Admin, RoleType::Blogger],
            'newsComment' => [RoleType::Admin, RoleType::Blogger],
            'newsMedia' => [RoleType::Admin, RoleType::Blogger],

            'viewOption' => [RoleType::Admin, RoleType::Coworker],
            'viewMedia' => [RoleType::Admin, RoleType::Coworker],

            'requestCategory' => [RoleType::Admin, RoleType::Coworker, RoleType::Contractor, RoleType::Member],
            'requestPost' => [RoleType::Admin, RoleType::Coworker, RoleType::Contractor, RoleType::Member],
            'requestReply' => [RoleType::Admin, RoleType::Coworker, RoleType::Contractor, RoleType::Member],

            'jobCategory' => [RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobSubCategory' => [RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobSubState' => [RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobPost' => [RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobApply' => [RoleType::Admin, RoleType::Coworker,RoleType::Member,RoleType::Contractor],
            'jobTag' => [ RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobBalance' => [RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobTransaction' => [RoleType::Admin, RoleType::Coworker,RoleType::Contractor],
            'jobPrice' => [RoleType::Admin, RoleType::Coworker, RoleType::Contractor],

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
