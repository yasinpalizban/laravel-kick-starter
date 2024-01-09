<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\GraphController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OverViewController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PermissionGroupController;
use App\Http\Controllers\PermissionUserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\UserController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::middleware('authJwt')->apiResource('overView',OverViewController::class );
Route::middleware('authJwt')->apiResource('graph', GraphController::class);



Route::middleware('authJwt')->apiResource('setting', SettingController::class);
Route::middleware('authJwt')->apiResource('profile', ProfileController::class);
Route::middleware('authJwt')->apiResource('user', UserController::class);




Route::middleware('authJwt')->apiResource('group', GroupController::class);
Route::middleware('authJwt')->apiResource('permission', PermissionController::class);
Route::middleware('authJwt')->resource('permission.permissionUser', PermissionUserController::class);
Route::middleware('authJwt')->apiResource('permissionUser', PermissionUserController::class);
Route::middleware('authJwt')->resource('permission.permissionGroup', PermissionGroupController::class);
Route::middleware('authJwt')->apiResource('permissionGroup', PermissionGroupController::class);

Route::prefix('auth')->group(function () {



    Route::middleware('isSignIn')->post('/signin', [AuthController::class, 'signIn']);

    Route::middleware('authJwt')->post('/signout', [AuthController::class, 'signOut']);

    Route::middleware('isSignIn')->post('/signup', [AuthController::class, 'signUp']);

    Route::middleware('authJwt')->post('/refresh', [AuthController::class, 'refresh']);

    Route::middleware('isSignIn')->post('/forgot', [AuthController::class, 'forgot']);

    Route::middleware('isSignIn')->post('/reset-password-email', [AuthController::class, 'resetPasswordViaEmail']);
    Route::middleware('isSignIn')->post('/reset-password-sms', [AuthController::class, 'resetPasswordViaSms']);

    Route::middleware('isSignIn')->post('/activate-account-email', [AuthController::class, 'activateAccountViaEmail']);
    Route::middleware('isSignIn')->post('/send-activate-email', [AuthController::class, 'sendActivateCodeViaEmail']);

    Route::middleware('isSignIn')->post('/activate-account-sms', [AuthController::class, 'activateAccountViaSms']);
    Route::middleware('isSignIn')->post('/send-activate-sms', [AuthController::class, 'sendActivateCodeViaSms']);


});
//Route::prefix('home')->group(function () {
//
//   // Route::get('',  [HomeController::class, 'index']);
//
//});
