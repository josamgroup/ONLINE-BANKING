<?php

namespace Modules\User\Http\Controllers\Auth;

use Illuminate\Routing\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Modules\Branch\Entities\Branch;
use Modules\Client\Entities\Client;
use Modules\Client\Entities\ClientUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use AfricasTalking\SDK\AfricasTalking;
use Illuminate\Support\Facades\Hash;
use Modules\User\Entities\User;
use Session;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }
/*
      * Display a listing of the resource.
     * @return Response
     */
   public function sendSms($phone,$message){
        //$username   = "fis";
        //$apiKey     = "4ce3303fe2f4cd61cc36bb3ee3a099145b25d8bc97582ce9d0048002d3297b0b";
        $username   = "josam-sacco";
        $apiKey     = "a0087eed693f9438514d3901c15241e8ae7726dcaee9a2d155e1f5997c2b7d42";
        //echo $message;exit;

        $AT   = new AfricasTalking($username, $apiKey);

        // Get the SMS service
        $sms        = $AT->sms();

        // Set the numbers you want to send to in international format
        $recipients = $phone;

        // Set your message
        $msg   = $message;

        // Set your shortCode or senderId
        $from       = "JOSAM-GROUP";

        try {
            // Thats it, hit send and we'll take care of the rest
            $result = $sms->send([
                'to'      => $recipients,
                'message' => $msg,
                'from'    => $from
            ]);

            //print_r($result);exit;
        } catch (Exception $e) {
            echo "Error: ".$e->getMessage();
           // exit;
        }

    }


    public function showLinkRequestForm()
    {
        return theme_view('user::auth.passwords.email');
    }

     public function resetPassword(Request $request)
    {
        $email = $request->email;
        $user = DB::table('users')->where('email', $email)->first();

        if (!$user) {
            //\flash("User Account not found ,Please check your credentials and try again... ")->error()->important();
            Session::flash('error','Something went wrong  ,Please check your credentials and try again... ');

            return redirect()->back();//->with(['error' => 'User Account not found ,Please check your credentials and try again... ']);
        }

          $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz@#!&*%ABCDEFGHIJKLMNOPQRSTUPWXYZ';
          $pass = substr(str_shuffle($permitted_chars), 0, 8);

        $credentials = [
            'password' => Hash::make($pass),
            'reset_password' => 1,
            'updated_at' => date("Y-m-d H:i:s")
        ];
        //print_r($user);exit;
        

        $users = User::find($user->id);

        $users->update($credentials);

        $msg ="Dear ".$user->first_name.' '.$user->last_name.". Your password has been reset , Please use: ".$pass."  as your password.";

        $this->sendSms($user->phone,$msg);

         //\flash("Password Reset Successfully")->success()->important();

        Session::flash('success','Password Reset Successfully ,You will receive SMS with new password');


        return redirect('login');//->with(['success' => 'Password Reset Successfully']);
    }
}
