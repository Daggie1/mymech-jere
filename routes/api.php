<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
//Route::any('/stk', 'Frontend\MpesaController@stkPush')->name('stkshow');
Route::post('/callback', 'Frontend\MpesaController@callback')->name('callbackhow');
Route::post('/access', 'Frontend\SafMpesaController@getAccessToken')->name('token');
