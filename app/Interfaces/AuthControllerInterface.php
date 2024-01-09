<?php

namespace App\Interfaces;



use App\Services\AuthService;
use Illuminate\Http\Request;

/**
 * Expected behavior of a Security.
 */
interface AuthControllerInterface
{

    public function signIn(Request $request,AuthService $authService) ;

    public function signOut(Request $request,AuthService $authService) ;

    public function refresh(Request $request, AuthService $authService) ;

    public function signUp(Request $request, AuthService $authService) ;

    public function forgot(Request $request, AuthService $authService) ;

    public function resetPasswordViaSms(Request $request, AuthService $authService) ;

    public function resetPasswordViaEmail(Request $request, AuthService $authService) ;

    public function activateAccountViaEmail(Request $request, AuthService $authService) ;

    public function sendActivateCodeViaEmail(Request $request, AuthService $authService) ;

    public function activateAccountViaSms(Request $request, AuthService $authService) ;

    public function sendActivateCodeViaSms(Request $request, AuthService $authService) ;
}

