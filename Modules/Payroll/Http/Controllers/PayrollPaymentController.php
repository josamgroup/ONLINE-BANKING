<?php

namespace Modules\Payroll\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Laracasts\Flash\Flash;
use Modules\Core\Entities\PaymentDetail;
use Modules\Core\Entities\PaymentType;
use Modules\Payroll\Entities\Payroll;
use Modules\Payroll\Entities\PayrollPayment;
use Modules\User\Entities\User;
use AfricasTalking\SDK\AfricasTalking;

class PayrollPaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:payroll.payroll.index'])->only(['index', 'show']);
        $this->middleware(['permission:payroll.payroll.create'])->only(['create', 'store']);
        $this->middleware(['permission:payroll.payroll.edit'])->only(['edit', 'update']);
        $this->middleware(['permission:payroll.payroll.destroy'])->only(['destroy']);

    }


public function sendSms($phone,$message){
        //$username   = "fis";
        //$apiKey     = "4ce3303fe2f4cd61cc36bb3ee3a099145b25d8bc97582ce9d0048002d3297b0b";
        $username   = "weslope";
        $apiKey     = "a6b234e3221f027093df83f914d1ab990c1d55cfeaf55120cb5431552891799f";
        //echo $message;exit;

        $AT         = new AfricasTalking($username, $apiKey);

        // Get the SMS service
        $sms        = $AT->sms();

        // Set the numbers you want to send to in international format
        $recipients = $phone;

        // Set your message
        $msg   = $message;

        // Set your shortCode or senderId
        $from       = "WESLOPE";

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

        public function b2c($phone, $amt){
          $amount =  round($amt,0);
          // echo $phone;
          // echo $amount;exit;
          $permitted_chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
          $access_token = $this->registerurl1();
          $url = 'https://api.safaricom.co.ke/mpesa/b2c/v1/paymentrequest';
          $curl = curl_init();
          curl_setopt($curl, CURLOPT_URL, $url);
          curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json','Authorization:Bearer '.$access_token.'')); //setting custom header
          $curl_post_data = array(
            //Fill in the request parameters with valid values
            'InitiatorName' => 'weslopeAPI',
            'SecurityCredential' => 'QPe3BFewodiolrhFL290b+1+Ni1r5Iu9zjs3x1x47U950qCdDm7ge83rr6+rbHkvfwg26feFLgS7No+nofC5wDJnPOggBu9xHUMNB2+dHfbVFtuZoD7AILosELd0GrhekUWVNyjWjbgZlsNR7jfYb0QowXDU5RX8P7iQeBLQ0Q5bR06RyxNJt+F+eHNBMuXnpFUtQRFcJpVQZGdEhGBbUcU4lgW2ZBcNY9f6URQLl3EuyrE6Ye0M64wTlfd7GxpHCV6gpe2YG9bqFAMUcVszopP2VtX71pWsYlvpZhZpB4997YFELgjlgLzlhrUy1Ettx16O24KUDdqnSu06lfD/lg==',
            'CommandID' => 'BusinessPayment',
            'PartyA' => '596113',
            'Amount' =>$amount,
            'PartyB' => $phone,
            'Remarks' => 'Customer Deposits',
            'QueueTimeOutURL' => 'https://weslopegalaxies.co.ke/b73eb19/callback/urlcheck',
            'ResultURL' => 'https://weslopegalaxies.co.ke/b73eb19/callback/saveresponse',
            'Occasion' => substr(str_shuffle($permitted_chars), 0, 16),
          );
         //echo '<pre>';
       //print_r($curl_post_data);exit;
          
          $data_string = json_encode($curl_post_data);
          
          curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
          curl_setopt($curl, CURLOPT_POST, true);
          curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
          
          $curl_response = curl_exec($curl);
          //print_r($curl_response);exit;
          
          return json_decode($curl_response)->ResponseCode;
        
    }

        public function registerurl1(){

        //header("Content-Type:application/json");
        $consumerkey    ="iDKeLBDkJbMizeAqOWO36yDoVO922Cnp";
        $consumersecret ="7sbMbmXOvL2MmIfI";
        /* testing environment, comment the below two lines if on production */
        $authenticationurl='https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
        /* production un-comment the below two lines if you are in production */
        //$authenticationurl='https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
        $credentials= base64_encode($consumerkey.':'.$consumersecret);
        $username=$consumerkey ;
        $password=$consumersecret;
          // Request headers
          $headers = array(  
            'Content-Type: application/json; charset=utf-8'
          );

          $ch = curl_init($authenticationurl);
          curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
          //curl_setopt($ch, CURLOPT_HEADER, TRUE); // Includes the header in the output
          curl_setopt($ch, CURLOPT_HEADER, FALSE); // excludes the header in the outpu
          curl_setopt($ch, CURLOPT_USERPWD, $username.':'.$password); // HTTP Basic Authentication
          $result = curl_exec($ch);  
          $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);  
          $result = json_decode($result);
          curl_close($ch);
          //print_r($result);exit;
     return $access_token=$result->access_token;


        
    }
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        return theme_view('payroll::payroll_payment.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create($id)
    {
        $payment_types = PaymentType::where('active', 1)->get();
        $payroll = Payroll::find($id);
        $payments = PayrollPayment::where('payroll_id', $id)->sum('amount');
        $balance = $payroll->gross_amount - $payments;
        return theme_view('payroll::payroll_payment.create', compact('payment_types', 'id', 'balance'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request, $id)
    {
        $payroll = Payroll::find($id);
        $user = User::find($payroll->user_id);
        $payments = PayrollPayment::where('payroll_id', $id)->sum('amount');
        $balance = $payroll->gross_amount - $payments;
        $request->validate([
            'amount' => ['required', 'numeric', 'max:' . $balance],
            'date' => ['required', 'date'],
            'payment_type_id' => ['required'],
        ]);

        //payment details
        $payment_detail = new PaymentDetail();
        $payment_detail->created_by_id = Auth::id();
        $payment_detail->payment_type_id = $request->payment_type_id;
        $payment_detail->transaction_type = 'payroll_transaction';
        $payment_detail->cheque_number = $request->cheque_number;
        $payment_detail->receipt = $request->receipt;
        $payment_detail->account_number = $request->account_number;
        $payment_detail->bank_name = $request->bank_name;
        $payment_detail->routing_code = $request->routing_code;
        $payment_detail->description = $request->description;
        $payment_detail->save();
        $payroll_payment = new PayrollPayment();
        $payroll_payment->created_by_id = Auth::id();
        $payroll_payment->payroll_id = $payroll->id;
        $payroll_payment->branch_id = $payroll->branch_id;
        $payroll_payment->payment_detail_id = $payment_detail->id;
        $payroll_payment->submitted_on = $request->date;
        $payroll_payment->amount = $request->amount;
        $payroll_payment->save();

        $msg ="Dear ".$user->first_name . ' ' . $user->last_name." your salary  of ".(int)$request->amount." has been processed.Thank you for being our valued employee.";
         $this->sendSms($user->phone,$msg);

         if((int)$request->payment_type_id === 3){
           //  echo (int)$request->amount;
           //  echo $user->phone;
           // exit();
            //$this->b2c($user->phone,(int)$request->amount);
        }
       
        activity()->on($payroll_payment)
            ->withProperties(['id' => $payroll_payment->id])
            ->log('Create Payroll Payment');
        //fire transaction updated event
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('payroll/' . $payroll->id . '/show');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        $payroll = Payroll::find($id);
        return theme_view('payroll::payroll_payment.show', compact('payroll'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $payroll_payment = PayrollPayment::find($id);
        $payment_types = PaymentType::where('active', 1)->get();
        return theme_view('payroll::payroll_payment.edit', compact('payment_types', 'payroll_payment'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $payroll_payment = PayrollPayment::find($id);
        $payroll = $payroll_payment->payroll;
        $payments = PayrollPayment::where('payroll_id', $id)->sum('amount');
        $balance = $payroll->gross_amount - $payments + $payroll_payment->amount;
        $request->validate([
            'amount' => ['required', 'numeric', 'max:' . $balance],
            'date' => ['required', 'date'],
            'payment_type_id' => ['required'],
        ]);

        //payment details
        $payment_detail = PaymentDetail::find($payroll_payment->payment_detail_id);
        $payment_detail->payment_type_id = $request->payment_type_id;
        $payment_detail->transaction_type = 'payroll_transaction';
        $payment_detail->cheque_number = $request->cheque_number;
        $payment_detail->receipt = $request->receipt;
        $payment_detail->account_number = $request->account_number;
        $payment_detail->bank_name = $request->bank_name;
        $payment_detail->routing_code = $request->routing_code;
        $payment_detail->description = $request->description;
        $payment_detail->save();
        $payroll_payment->submitted_on = $request->date;
        $payroll_payment->amount = $request->amount;
        $payroll_payment->save();
        activity()->on($payroll_payment)
            ->withProperties(['id' => $payroll_payment->id])
            ->log('Update Payroll Payment');
        //fire transaction updated event
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('payroll/' . $payroll->id . '/show');
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        $payroll_payment= PayrollPayment::find($id);
        $payroll_payment->delete();
        PaymentDetail::destroy($payroll_payment->payment_detail_id);
        activity()->on($payroll_payment)
            ->withProperties(['id' => $payroll_payment->id])
            ->log('Delete Payroll Payment');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }
}
