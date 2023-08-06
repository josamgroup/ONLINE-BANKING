<?php
/**
 * Created by PhpStorm.
 * User: tj
 * Date: 6/15/19
 * Time: 11:45 AM
 */

namespace Modules\Api\Http\Controllers\v1;



//use GuzzleHttp\Client;
use GuzzleHttp\Exception\BadResponseException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Nwidart\Modules\Routing\Controller;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\DB;
use Modules\Client\Entities\Client;
use AfricasTalking\SDK\AfricasTalking;

class AuthController extends Controller
{  


   public function sendSms($phone,$message){
        //$username   = "fis";
        //$apiKey     = "4ce3303fe2f4cd61cc36bb3ee3a099145b25d8bc97582ce9d0048002d3297b0b";
        $username   = "mantra.api";
        $apiKey     = "fd0c96399230778bd90462254cf276577ad894fb8d79690a1fa854388d234123";
        //echo $message;exit;

        $AT         = new AfricasTalking($username, $apiKey);

        // Get the SMS service
        $sms        = $AT->sms();

        // Set the numbers you want to send to in international format
        $recipients = $phone;

        // Set your message
        $msg   = $message;

        // Set your shortCode or senderId
        $from       = "MANTRA-EQ";

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



    public function login(Request $request)
    {
        // $client = new Client();
        // try {
        //     $response = $client->post(url('oauth/token'), [
        //         'form_params' => [
        //             'grant_type' => 'password',
        //             'client_id' => config('api.passport.client_id'),
        //             'client_secret' => config('api.passport.client_secret'),
        //             'username' => $request->username,
        //             'password' => $request->password
        //         ]
        //     ]);
        //     return $response->getBody();
        // } catch (BadResponseException $e) {
        //     if ($e->getCode() == 400) {
        //         return response()->json("Invalid request, please enter username or password", $e->getCode());
        //     } elseif ($e->getCode() == 401) {
        //         return response()->json("Invalid login details", $e->getCode());
        //     } else {
        //         return response()->json("Something went wrong on our server", $e->getCode());
        //     }
        // }
    }
    public function getAccount($phone)
          {
            $info = DB::select("SELECT * FROM clients WHERE phone =".$phone." AND status ='active' ");
        
             return $info[0];
        
           
            //print_r($info);exit;
            
       
         }

    public function login2(Request $request)
    {
        $client = new Client();

        $phone="254".(int)$request->phone;
       //print_r($this->getAccount($phone));
       //exit;
        if($this->getAccount($phone)){

        $data =$this->getAccount($phone);
        if($data->password){
        if($data->idnumber){
            //print_r($data);
            $pass_hash = $data->password;
            //echo password_verify($request->password, $pass_hash);
            if(password_verify($request->password, $pass_hash)){

            return response()->json(array("msg"=>"Login Success", "status"=>200,'data'=>$data));
            
            }else{
                 return response()->json(array("msg"=>"You have entered wrong password", "status"=>400,'data'=>''));
            }
                }else{
                    return response()->json(array("msg"=>"Your account have some missing credentials", "status"=>400,'data'=>''));
                }

            }else{


                 $client = Client::find($data->id);
                 $client->password = Hash::make($data->idnumber);
                 $client->save();

                 $msg ="Dear ".$data->first_name." ".$data->last_name." your account password has been generated for the first time ,please use your phone and  ".$data->idnumber." as your password .Thank you.";
                     $this->sendSms($data->mobile,$msg);


              return response()->json(array("msg"=>"No password set we have generated a password and sent to your registered phone ,thank and try using password received ", "status"=>400,'data'=>''));


            }


        }else{
       return response()->json(array("msg"=>"Account does not exist or not active", "status"=>400,'data'=>''));
        }

        //exit();

        // print_r([
        //         'form_params' => [
        //             'grant_type' => 'password',
        //             'client_id' => config('api.passport.client_id'),
        //             'client_secret' => config('api.passport.client_secret'),
        //             'username' => $request->phone,
        //             'password' => $request->password
        //         ]
        //     ]);
        //exit();

        // try {
        //     $response = $client->post(url('oauth/token'), [
        //         'form_params' => [
        //             'grant_type' => 'password',
        //             'client_id' => config('api.passport.client_id'),
        //             'client_secret' => config('api.passport.client_secret'),
        //             'phone' => $request->phone,
        //             'password' => $request->password
        //         ]
        //     ]);
        //      print_r($response);exit();
        //     return response()->json(array("msg"=>"Invalid request, please enter username or password", "status"=>$e->getCode(),'data'=>$response->getBody()));
        //     //return $response->getBody();
        // } catch (BadResponseException $e) {
        //     if ($e->getCode() == 400) {
        //         return response()->json(array("msg"=>"Invalid request, please enter username or password", "status"=>$e->getCode()));
        //     } elseif ($e->getCode() == 401) {
        //         return response()->json(array("msg"=>"Invalid login details", 'status'=>$e->getCode()));
        //     } else {
        //         return response()->json(array("msg"=>"Something went wrong on our server", 'status'=>$e->getCode()));
        //     }
        // }
    }



    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required',
            'phone' => 'required',
            'last_name' => 'required',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8',],
        ]);
        if ($validator->fails()) {
            return response()->json(["error" => $validator->errors()], 422);
        } else {
            $google2fa = app('pragmarx.google2fa');
            $user = User::create([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'email' => $request->email,
                "otp" => rand(20000, 29999),
                "google2fa_secret" => $google2fa->generateSecretKey(),
                'password' => Hash::make($request->password),
            ]);
            $role = Role::findByName("Client");
            $user->assignRole($role);
            //check if there is an kyc tier
            $default_kyc_tier = KycTier::find(Setting::where('setting_key',
                'default_kyc_tier')->first()->setting_value);
            if (!empty($default_kyc_tier)) {
                $user_kyc = new UserKycTier();
                $user_kyc->user_id = $user->id;
                $user_kyc->kyc_tier_id = $default_kyc_tier->id;
                $user_kyc->status = "approved";
                $user_kyc->save();
                $user->kyc_tier_id = $default_kyc_tier->id;
                $user->save();
            }
            event(new UserRegistration($user));
            if (Setting::where('setting_key', 'notify_user_registration')->first()->setting_value == 1) {
                event(new UserRegistered($user));
            }
            return response()->json(["user" => $user], 200);
        }
    }

    public function logout()
    {
        auth()->user()->tokens->each(function ($token, $key) {
            $token->delete();
        });
        return response()->json("Successfully logged out", 200);
    }

    public function get_user()
    {

        return response()->json(["user" => auth()->user()], 200);
    }
}