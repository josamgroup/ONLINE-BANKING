<?php

namespace Modules\User\Http\Controllers\Auth;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Laracasts\Flash\Flash;
use Modules\Client\Entities\ClientUser;
use Illuminate\Support\Facades\DB;
use Modules\User\Entities\User;
use AfricasTalking\SDK\AfricasTalking;
use Session;
use Spatie\Permission\Models\Role;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */

    protected $redirectTo = '/dashboard';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');

    }

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

    public function showLoginForm()
    {
        return theme_view('user::auth.login');
    }

    /**
     * The user has been authenticated.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  mixed $user
     * @return mixed
     */
    protected function authenticated(Request $request, $user)
    {


        if (Auth::user()->hasRole('client')) {
            $client = ClientUser::with('client')->where('user_id', Auth::id())->first();
            //print_r($client);exit;
            if (!empty($client->client)) {
                session(['client_id' => $client->client_id]);
                return redirect('/portal/dashboard');
            } else {
                Flash::warning(trans_choice('portal::general.no_linked_client_found', 1));
                $this->guard()->logout();
                $request->session()->invalidate();
                return redirect('login');
            }
        } else {

           // return redirect('/2fa');

            return redirect()->intended($this->redirectPath());
        }
    }

    protected function check(Request $request)
    {
            $request->validate([
            'password' => ['required'],
            'email' => ['nullable','email', 'max:255'],
        ]);

        $email = $request->email;
        $password = $request->password;
        $user = DB::table('users')->where('email', $email)->first();
       
           if($user){

             $pass_hash = $user->password;

            if(password_verify($request->password, $pass_hash)){


                $otp = random_int(100000, 999999);
                    $credentials = [
                    'otp' => $otp,
                    'updated_at' => date("Y-m-d H:i:s")
                ];

                $users = User::find($user->id);

                $users->update($credentials);

                $msg ="Dear ".$user->first_name.' '.$user->last_name.". Please use: ".$otp."  as your One Time Password.";

                $this->sendSms($user->phone,$msg);

                 return theme_view('user::auth.passwords.otp',compact('user','email','password'));

            }else{
                 Session::flash('error','Wrong Credentials Provided credentials does not match our records');
                 return redirect()->back();

            }
        }else{

             Session::flash('error','Wrong Credentials Provided credentials does not match our records');
             return redirect()->back();
        }
          
    }

     protected function verify(Request $request)
    {

$data = $request->all();
$otp = DB::select('SELECT * FROM users WHERE id = ?' , [$request->id]);
//echo $otp[0]->otp;exit;

        if($otp){

            if($otp[0]->otp == $request->otp){
                return $arrayName = array('message' =>'ok' ,'status'=>true );

            }else{
                return  $arrayName = array('message' =>'ok' ,'status'=>false );
            }
        }else{
            return  $arrayName = array('message' =>'ok' ,'status'=>false );
        }
//print_r($data);


    }

    protected function otp(Request $request)
    {
            $request->validate([
            'otp' => ['required'],
    
        ]);

       $id = $request->id;
     $user = DB::table('users')->where('id', $id)->first();

                session(['client_id' => $user->id]);
    

    if($user){
            if((int)$request->otp == (int)$user->otp){

                $role = Role::findByName('client');

               

          
        // 

        // $client = ClientUser::with('client')->where('user_id', Auth::id())->first();
      $client = ClientUser::with('client')->where('user_id', $user->id)->first();
            //echo "<pre>";
            print_r($client);
            $cl =$client;
            // echo $cl->client_type_id;
            //  exit;

        if ($cl->client_type_id == 1 ) {
            session(['client_id' => $user->id]);

            // return redirect()->intended($this->redirectPath());
          
        } else {

           // return redirect('/2fa');


            if ($cl->client_type_id == 2) {
                echo 'portal';exit;
                // session(['client_id' => $user->id]);
                // return redirect('/portal/dashboard');
            } else {
                echo 'invall';exit;
                // Flash::warning(trans_choice('portal::general.no_linked_client_found', 1));
                // $this->guard()->logout();
                // $request->session()->invalidate();
                // return redirect('login');
            }
        }


    
                    $credentials = [
                    'otp' => NULL,
                    'updated_at' => date("Y-m-d H:i:s")
                ];

                $users = User::find($client->id);

                $users->update($credentials);
       
           
        }else{
             Session::flash('error','Wrong OTP provided');
             return redirect()->back();

        }
    }else{

         Session::flash('success','Something went wrong please try reseting password again...');
             return redirect()->back();
      
    }
    }
}
