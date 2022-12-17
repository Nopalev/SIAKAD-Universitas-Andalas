<?php

use App\Http\Controllers\SessionController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/session', [SessionController::class, 'index']);

Route::post('/session/login', [SessionController::class, 'login']);

Route::get('/session/logout', [SessionController::class, 'logout']);

Route::get('/session/register', [SessionController::class, 'register']);

Route::post('/session/create', [SessionController::class, 'create']);