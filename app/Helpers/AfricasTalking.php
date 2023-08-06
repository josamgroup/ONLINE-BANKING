<?php
namespace App\Helpers;

use App\Models\Setting;
use AfricasTalking\SDK\AfricasTalking;

class AfricasTalking
{

//Constructor..
    public function __construct($from, $message, $mobile)
    {

        //$username   = "fis";
        //$apiKey     = "4ce3303fe2f4cd61cc36bb3ee3a099145b25d8bc97582ce9d0048002d3297b0b";
        $username   = "josam-sacco";
        $apiKey     = "a0087eed693f9438514d3901c15241e8ae7726dcaee9a2d155e1f5997c2b7d42";
        //echo $message;exit;

        $AT         = new AfricasTalking($username, $apiKey);

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

    

        // $mobile_num = $mobile;
        // if (is_numeric($mobile_num) == TRUE) {
        //     $mobile_num = str_replace(' ', '', $mobile_num);
        // }
        // //REMOVE LEADING ZEROS
        // $message = "$message ";

        // $username = Setting::where('setting_key', 'infobip_username')->first()->setting_value;
        // $password = Setting::where('setting_key', 'infobip_password')->first()->setting_value;
        // $message = urlencode($message);

        // $url="http://api.infobip.com/api/v3/sendsms/plain?user=$username&password=$password&sender=$from&SMSText=$message&GSM=$mobile_num&type=longSMS";
        // //$url="http://api.infobip.com/api/v3/sendsms/plain?user=$username&password=&sender=$from&SMSText=$message&GSM=$mobile_num&type=longSMS";
        // $ch = curl_init();
        // curl_setopt($ch, CURLOPT_URL, $url);
        // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($ch, CURLOPT_VERBOSE, true);
        // $curl_scraped_page = curl_exec($ch);
        // curl_close($ch);
    }
}

?>