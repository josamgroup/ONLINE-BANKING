<?php

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

Auth::routes();

Route::prefix('guarantor')->group(function () {
    Route::get('verify/{id}/q', 'VerifyController@index');
});

Route::prefix('reset')->group(function () {
    Route::post('password', 'Auth\ForgotPasswordController@resetPassword');
   
});

Route::prefix('auth')->group(function () {
    Route::post('check', 'Auth\LoginController@check');
    Route::post('otp', 'Auth\LoginController@otp');
    Route::get('verify', 'Auth\LoginController@verify');
    Route::get('reset_password', 'BusinessController@changepassword');
    Route::post('update_password', 'BusinessController@update_password');
    // Route::get('user/performance', 'ReportController@performance');
});


Route::prefix('user')->group(function () {
    Route::get('/', 'BusinessController@index');
    Route::get('/get_users', 'BusinessController@get_users');
    Route::get('create', 'BusinessController@create');
    Route::post('store', 'BusinessController@store');
    Route::get('{id}/show', 'BusinessController@show');
    Route::get('{id}/edit', 'BusinessController@edit');
    Route::post('{id}/update', 'BusinessController@update');
    Route::get('{id}/destroy', 'BusinessController@destroy');
    Route::get('edit_profile', 'BusinessController@edit_profile');
    Route::post('update_profile', 'BusinessController@update_profile');
    Route::get('profile', 'BusinessController@profile');
    Route::post('profile/update_profile', 'BusinessController@update_profile');
    Route::get('profile/change_password', 'BusinessController@change_password');
    Route::post('profile/update_password', 'BusinessController@update_password');
    Route::get('profile/note', 'BusinessController@note');
    Route::get('profile/notification', 'BusinessController@notification');
    Route::get('profile/notification/mark_all_as_read', 'BusinessController@mark_all_notifications_as_read');
    Route::get('profile/notification/{id}/mark_as_read', 'BusinessController@mark_notification_as_read');
    Route::get('profile/notification/{id}/destroy', 'BusinessController@destroy_notification');
    Route::get('profile/notification/{id}/show', 'BusinessController@show_notification');
    Route::get('profile/activity_log/get_activity_logs', 'BusinessController@get_activity_logs');
    Route::get('profile/activity_log', 'BusinessController@activity_log');
    Route::get('profile/activity_log/{id}/show', 'BusinessController@show_activity_log');
    Route::get('profile/api', 'BusinessController@api');
    Route::post('profile/api/store_personal_access_token', 'BusinessController@store_personal_access_token');
    Route::post('profile/api/update_personal_access_token', 'BusinessController@update_personal_access_token');
    Route::get('profile/api/personal_access_token/{id}/destroy', 'BusinessController@destroy_personal_access_token');
    Route::post('profile/api/store_oauth_client', 'BusinessController@store_oauth_client');
    Route::post('profile/api/update_oauth_client', 'BusinessController@update_oauth_client');
    Route::get('profile/api/oauth_client/{id}/destroy', 'BusinessController@destroy_oauth_client');

    Route::get('profile/two_factor', 'BusinessController@two_factor');
    Route::post('profile/two_factor/enable', 'BusinessController@two_factor_enable');
    Route::post('profile/two_factor/disable', 'BusinessController@two_factor_disable');
    Route::post('profile/api/store_personal_access_token', 'BusinessController@store_personal_access_token');
    //
    Route::prefix('role')->group(function () {
        Route::get('/', 'RoleController@index');
        Route::get('/get_roles', 'RoleController@get_roles');
        Route::get('create', 'RoleController@create');
        Route::post('store', 'RoleController@store');
        Route::get('{id}/show', 'RoleController@show');
        Route::get('{id}/edit', 'RoleController@edit');
        Route::post('{id}/update', 'RoleController@update');
        Route::get('{id}/destroy', 'RoleController@destroy');
    });
});
Route::post('/2fa', function () {
    return redirect(URL()->previous());
})->name('2fa')->middleware('2fa');
//reports
Route::prefix('report')->group(function () {
    Route::get('user', 'ReportController@index');
    Route::get('user/performance', 'ReportController@performance');
});