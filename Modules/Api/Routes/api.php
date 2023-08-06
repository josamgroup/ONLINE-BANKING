<?php

use Illuminate\Http\Request;
//use App\Http\Controllers;
//use App\Http\Controllers\v1\LoanController;



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
Route::prefix('v1')->group(function () {

    Route::post('logind', 'v1\AuthController@login');
     Route::post('login2', 'v1\AuthController@login2');
     //Route::post('my-loans', 'PortalLoanController@my_loans');
    Route::post('registers', 'v1\AuthController@register');

        Route::get('/client-loans', 'v1\LoanController@index');
        Route::post('get_loans', 'v1\LoanController@get_loans');
        Route::post('dashboard', 'v1\LoanController@dashboard');
        Route::post('recharge', 'v1\LoanController@wallets');
        //Route::post('recharge', 'v1\LoanController@wallets');
        Route::get('loan_products', 'v1\LoanController@loan_products');
        //Route::get('/get_loans', [LoanController::class, 'get_loans']);
        Route::get('{id}/show', 'v1\LoanController@show');
        Route::post('switch_client', 'v1\LoanController@switch_client');
        //Route::get('{id}/transaction/create', 'LoanTransactionController@create');
        //Route::post('{id}/transaction/store', 'LoanTransactionController@store');
        Route::get('transactions/{id}/show', 'v1\LoanController@show_transaction');
        Route::get('transactions/{id}/pdf', 'v1\LoanController@pdf_transaction');
        Route::get('transactions/{id}/print', 'v1\LoanController@print_transaction');
         Route::get('email', 'v1\LoanController@arreas');
        //schedules
        Route::get('{id}/schedules/show', 'v1\LoanController@show_schedule');
        Route::get('{id}/schedules/pdf', 'v1\LoanController@pdf_schedule');
        Route::get('{id}/schedules/print', 'v1\LoanController@print_schedule');
        //applications
        Route::post('applications', 'v1\LoanController@my_application');
        Route::post('wallets', 'v1\LoanController@my_application');
        // Route::get('applications/create', 'LoanController@create_application');
        Route::post('applications/borrow', 'v1\LoanController@borrow_loan');
        Route::get('applications/{id}/destroy', 'v1\LoanController@destroy_application');
        //repayments

        Route::post('timeout', 'v1\CallbackController@check');
        Route::post('callback', 'v1\CallbackController@save');
       

        
        Route::post('savings', 'v1\SavingsController@get_savings');
        Route::get('{id}/repayments/create', 'v1\LoanController@create_repayment');
        Route::post('{id}/repayments/store', 'v1\LoanController@store_repayment');
        Route::get('repayments/{id}/edit', 'v1\LoanController@edit_repayment');
        Route::get('repayments/{id}/reverse', 'v1\LoanController@reverse_repayment');
        Route::post('repayments/{id}/update', 'v1\LoanController@update_repayment');
        Route::get('repayments/{id}/destroy', 'v1\LoanController@destroy_repayment');
   



    Route::middleware('auth:api')->post('/logoutd', 'v1\AuthController@logout');

});
