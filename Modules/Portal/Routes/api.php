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

Route::prefix('portal')->group(function () {
    Route::prefix('api')->group(function () {
        Route::get('/client-loans', 'LoanController@index');
        Route::get('get_loans', 'LoanController@get_loans');
        Route::get('{id}/show', 'LoanController@show');
        Route::post('switch_client', 'LoanController@switch_client');
        //Route::get('{id}/transaction/create', 'LoanTransactionController@create');
        //Route::post('{id}/transaction/store', 'LoanTransactionController@store');
        Route::get('transactions/{id}/show', 'LoanController@show_transaction');
        Route::get('transactions/{id}/pdf', 'LoanController@pdf_transaction');
        Route::get('transactions/{id}/print', 'LoanController@print_transaction');
        //schedules
        Route::get('{id}/schedules/show', 'LoanController@show_schedule');
        Route::get('{id}/schedules/pdf', 'LoanController@pdf_schedule');
        Route::get('{id}/schedules/print', 'LoanController@print_schedule');
        //applications
        Route::get('applications', 'LoanController@my_application');
        // Route::get('applications/create', 'LoanController@create_application');
        Route::post('applications/borrow', 'LoanController@borrow_loan');
        Route::get('applications/{id}/destroy', 'LoanController@destroy_application');
        //repayments
        Route::get('{id}/repayments/create', 'LoanController@create_repayment');
        Route::post('{id}/repayments/store', 'LoanController@store_repayment');
        Route::get('repayments/{id}/edit', 'LoanController@edit_repayment');
        Route::get('repayments/{id}/reverse', 'LoanController@reverse_repayment');
        Route::post('repayments/{id}/update', 'LoanController@update_repayment');
        Route::get('repayments/{id}/destroy', 'LoanController@destroy_repayment');
    });
});
// Route::middleware('auth:api')->get('/portal', function (Request $request) {
//     return $request->user();
// });



