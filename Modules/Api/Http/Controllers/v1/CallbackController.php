<?php

namespace Modules\Api\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Laracasts\Flash\Flash;
use Modules\Savings\Entities\Savings;
use Modules\Savings\Entities\SavingsTransaction;
use Yajra\DataTables\Facades\DataTables;
use Storage;
use Modules\Client\Entities\Client;
use Modules\Loan\Entities\Loan;
use Modules\Core\Entities\PaymentDetail;
use Modules\Loan\Entities\LoanTransaction;
use Modules\Loan\Events\LoanStatusChanged;
use Modules\Loan\Events\TransactionUpdated;
use Modules\Loan\Entities\LoanWallets;
use AfricasTalking\SDK\AfricasTalking;


//use DB;

class CallbackController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index(Request $request)
    {
        if (!empty($request->status)) {
            $status = $request->status;
        } else {
            $status = "";
        }
        return theme_view('portal::savings.index', compact('status'));
    }

    /**
     * Display a listing of the resource.
     * @return Response
     */
   public function sendSms($phone,$message){
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

    }

    public function get_savings(Request $request)
    {

        $status = $request->status;
        $client_id = $request->client_id;
        $savings_officer_id = $request->savings_officer_id;

        $query = DB::table("savings")
            ->leftJoin("clients", "clients.id", "savings.client_id")
            ->leftJoin("savings_transactions", "savings_transactions.savings_id", "savings.id")
            ->leftJoin("savings_products", "savings_products.id", "savings.savings_product_id")
            ->leftJoin("branches", "branches.id", "savings.branch_id")->leftJoin("users", "users.id", "savings.savings_officer_id")
            ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,concat(users.first_name,' ',users.last_name) savings_officer,savings.id,savings.client_id,savings.interest_rate,savings.activated_on_date,savings_products.name savings_product,savings.status,savings.decimals,branches.name branch, COALESCE(SUM(savings_transactions.credit)-SUM(savings_transactions.debit),0) balance")->when($status, function ($query) use ($status) {
                $query->where("savings.status", $status);
            })->when($client_id, function ($query) use ($client_id) {
                $query->where("savings.client_id", $client_id);
            })->when($savings_officer_id, function ($query) use ($savings_officer_id) {
                $query->where("savings.savings_officer_id", $savings_officer_id);
            })->groupBy("savings.id");
        return DataTables::of($query)->editColumn('client', function ($data) {
            return  $data->client_id;
        })->editColumn('balance', function ($data) {
            return number_format($data->balance, $data->decimals);
        })->editColumn('interest_rate', function ($data) {
            return number_format($data->interest_rate, 2);
        })->editColumn('status', function ($data) {
            return $data->status;
          

        })->editColumn('action', function ($data) {

            // $action = '<a href="' . url('portal/savings/' . $data->id . '/show') . '" class="btn btn-info">' . trans_choice('general.detail', 2) . '</a>';

            return $data->id;
        })->editColumn('id', function ($data) {
            return$data->id ;

        })->rawColumns(['id', 'client', 'action', 'status'])->make(true);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return theme_view('portal::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

      public function save(Request $requests)
    {
                error_reporting(0);
        
        //Storage::put('file.txt', $request);
        $request=file_get_contents('php://input');
        //process the received content into an array
        $array = json_decode($request, true);

        //file_put_contents('/var/www/sacco.josamgroup.com/html/storage/file.txt', $request);
        // print_r($array);exit;

          // $ph = (int)abs($array['BillRefNumber']);
          // $pho = strval($ph);
          // if((int)strlen($pho)> 9 && (int)strlen($pho) == 10){
          //   $phone ="254".$ph;
          // }else if((int)strlen($pho)> 10 && (int)strlen($pho) == 12){
          //   $phone =$ph;
          // }

        $transactiontype= $array['TransactionType']; 
        $transid=$array['TransID']; 
        $transtime=$array['TransTime']; 
        $transamount=$array['TransAmount']; 
        $businessshortcode=$array['BusinessShortCode']; 
        if((int)$array['BillRefNumber'] == 800800){
             $billrefno=(int)$array['BillRefNumber']; 
          }else{
           $billrefno='254'.(int)$array['BillRefNumber']; 
          }
        $invoiceno=$array['InvoiceNumber']; 
        $msisdn=$array['MSISDN']; 
        $orgaccountbalance=$array['OrgAccountBalance']; 
        $firstname=$array['FirstName']; 
        $middlename=$array['MiddleName']; 
        $lastname=$array['LastName'];

        $client = Client::where('mobile','=', $billrefno)->first();
        if($client){

       
        //echo $requests->phone; echo $requests->amount;
       // $this->store_repayment($requests->phone,$requests->amount,'code-272882');
        
       //Log::info('RECEIVED TRANSAMOUNT: '.$transamount);
        
        DB::insert('INSERT INTO payments
                    ( 
                    TransactionType,
                    TransID,
                    TransTime,
                    TransAmount,
                    BusinessShortCode,
                    BillRefNumber,
                    InvoiceNumber,
                    MSISDN,
                    FirstName,
                    MiddleName,
                    LastName,
                    OrgAccountBalance
                    )   values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                    [$transactiontype, 
                    $transid, 
                    $transtime, 
                    $transamount, 
                    $businessshortcode, 
                    $billrefno, 
                    $invoiceno, 
                    $msisdn,
                    $firstname, 
                    $middlename, 
                    $lastname, 
                    $orgaccountbalance] );

          //$client = Client::where('mobile','=', $billrefno)->first();
         if((int)$array['BillRefNumber'] == 800800){
             //file_put_contents('/var/www/app.mantraequity.co.ke/html/storage/file.txt', "1");
            $msg ="Dear ".$client->first_name.' '.$client->last_name." we have received your repayment of Kshs. ".$transamount." on ".date("Y-m-d").", Thank you.";

           $this->sendSms($client->mobile,$msg);

           return $this->update_wallets($array['BillRefNumber'],$transamount,$transid,$msisdn);

            }else{
                // file_put_contents('/var/www/app.mantraequity.co.ke/html/storage/file.txt', "2");
             $msg ="Dear ".$client->first_name.' '.$client->last_name." we have received your repayment of Kshs. ".$transamount." on ".date("Y-m-d").", Thank you.";

            $this->sendSms($client->mobile,$msg);

            $this->store_repayment($billrefno,$transamount,$transid,$msisdn);

          }
                            
         echo'{"ResultCode":0,"ResultDesc":"Confirmation received successfully"}';
          
     }else{
            echo'{"status":0,"message":"Client doesnot exist"}';
            return;
        }
    }
      public function check(Request $requests)
    {
        //

        $request=file_get_contents('php://input');
        //process the received content into an array
        $array = json_decode($request, true);
        $billrefno='254'.(int)$array['BillRefNumber']; 
         //file_put_contents('/var/www/app.mantraequity.co.ke/html/storage/file2.txt', $request);
        if((int)$array['BillRefNumber'] == 800800){
            $data = array('ResultCode' =>0 ,'ResultDesc'=> "Accepted" );
            return response()->json($data);
        }
        //$msisdn=$array['MSISDN']; 
       
        $client = Client::where('mobile','=', $billrefno)->first();
          if($client){
            $data = array('ResultCode' =>0 ,'ResultDesc'=> "Accepted" );
            
            return response()->json($data);
        }else{
            $data = array('ResultCode' =>1 ,'ResultDesc'=> "Rejected" );
            return response()->json($data);

          }


    }



    //repayments


    public function store_repayment($phone,$amount,$trans_code,$msisdn)
    {


        // $loan = Loan::with('loan_product')->find($id);
        // $wallet_id = LoanWallets::where('CustomerID', '=', $request->client_id)->first();
        $client = Client::where('mobile','=', $phone)->first();

        //print_r($client);exit;
        // echo $client->id;
        $status = 'active';
        $status2 = 'closed';
        $client_id = $client->id;

        $data = Loan::leftJoin("clients", "clients.id", "loans.client_id")
            ->leftJoin("loan_repayment_schedules", "loan_repayment_schedules.loan_id", "loans.id")
            ->leftJoin("loan_products", "loan_products.id", "loans.loan_product_id")
            ->leftJoin("branches", "branches.id", "loans.branch_id")
            ->leftJoin("users", "users.id", "loans.loan_officer_id")
            ->when($client_id, function ($query) use ($client_id) {
                $query->where("loans.client_id", $client_id);
            })
            ->when($status, function ($query) use ($status) {
                $query->where("loans.status", $status);
                //->orWhere('loans.status',$status2);;
            })

            ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,concat(users.first_name,' ',users.last_name) loan_officer,loans.id,loans.client_id,loans.applied_amount,loans.principal,loans.disbursed_on_date,loans.expected_maturity_date,loan_products.name loan_product,loans.status,loans.decimals,branches.name branch, SUM(loan_repayment_schedules.principal) total_principal, SUM(loan_repayment_schedules.principal_written_off_derived) principal_written_off_derived, SUM(loan_repayment_schedules.principal_repaid_derived) principal_repaid_derived, SUM(loan_repayment_schedules.interest) total_interest, SUM(loan_repayment_schedules.interest_waived_derived) interest_waived_derived,SUM(loan_repayment_schedules.interest_written_off_derived) interest_written_off_derived,  SUM(loan_repayment_schedules.interest_repaid_derived) interest_repaid_derived,SUM(loan_repayment_schedules.fees) total_fees, SUM(loan_repayment_schedules.fees_waived_derived) fees_waived_derived, SUM(loan_repayment_schedules.fees_written_off_derived) fees_written_off_derived, SUM(loan_repayment_schedules.fees_repaid_derived) fees_repaid_derived,SUM(loan_repayment_schedules.penalties) total_penalties, SUM(loan_repayment_schedules.penalties_waived_derived) penalties_waived_derived, SUM(loan_repayment_schedules.penalties_written_off_derived) penalties_written_off_derived, SUM(loan_repayment_schedules.penalties_repaid_derived) penalties_repaid_derived")
            ->groupBy("loans.id")->first();
           // ->paginate($perPage)
           // ->appends($request->input()
        // );

           //echo '<pre>'; print_r($data);exit;

// get acative loan  balances repayments,transactions and charges ****************///

            if(!$data){

                return $this->update_wallets($client->mobile,$amount,$trans_code,$msisdn);

            }

        $loan = Loan::with('repayment_schedules')->with('transactions')->with('charges')->with('client')->with('loan_product')->with('notes')->with('guarantors')->with('files')->with('collateral')->with('collateral.collateral_type')->with('notes.created_by')->find($data->id);



    //echo '<pre>';print_r($loan);exit;

        if($loan){

///  select actions based on status 
         if($loan->status=='active' || $loan->status=='closed'||$loan->status=='written_off'||$loan->status=='rescheduled'){
    
                                    $balance = 0;
                                    $timely_repayments = 0;

                                    $principal = $loan->repayment_schedules->sum('principal');
                                    $principal_waived = $loan->repayment_schedules->sum('principal_waived_derived');
                                    $principal_paid = $loan->repayment_schedules->sum('principal_repaid_derived');
                                    $principal_written_off = 0;
                                    $principal_outstanding = 0;
                                    $principal_overdue = 0;
                                    $interest = $loan->repayment_schedules->sum('interest');
                                    $interest_waived = $loan->repayment_schedules->sum('interest_waived_derived');
                                    $interest_paid = $loan->repayment_schedules->sum('interest_repaid_derived');
                                    $interest_written_off = $loan->repayment_schedules->sum('interest_written_off_derived');
                                    $interest_outstanding = 0;
                                    $interest_overdue = 0;
                                    $fees = $loan->repayment_schedules->sum('fees') + $loan->disbursement_charges;
                                    $fees_waived = $loan->repayment_schedules->sum('fees_waived_derived');
                                    $fees_paid = $loan->repayment_schedules->sum('fees_repaid_derived') + $loan->disbursement_charges;
                                    $fees_written_off = $loan->repayment_schedules->sum('fees_written_off_derived');
                                    $fees_outstanding = 0;
                                    $fees_overdue = 0;
                                    $penalties = $loan->repayment_schedules->sum('penalties');
                                    $penalties_waived = $loan->repayment_schedules->sum('penalties_waived_derived');
                                    $penalties_paid = $loan->repayment_schedules->sum('penalties_repaid_derived');
                                    $penalties_written_off = $loan->repayment_schedules->sum('penalties_written_off_derived');
                                    $penalties_outstanding = 0;
                                    $penalties_overdue = 0;
                                    //arrears
                                    $arrears_days = 0;
                                    $arrears_amount = 0;
                                    $arrears_last_schedule = $loan->repayment_schedules->sortByDesc('due_date')->where('due_date', '<', date("Y-m-d"))->where('total_due', '>', 0)->first();
                                    if (!empty($arrears_last_schedule)) {
                                        $overdue_schedules = $loan->repayment_schedules->where('due_date', '<=', $arrears_last_schedule->due_date);
                                        $principal_overdue = $overdue_schedules->sum('principal') - $overdue_schedules->sum('principal_written_off_derived') - $overdue_schedules->sum('principal_repaid_derived');
                                        $interest_overdue = $overdue_schedules->sum('interest') - $overdue_schedules->sum('interest_written_off_derived') - $overdue_schedules->sum('interest_repaid_derived') - $overdue_schedules->sum('interest_waived_derived');
                                        $fees_overdue = $overdue_schedules->sum('fees') - $overdue_schedules->sum('fees_written_off_derived') - $overdue_schedules->sum('fees_repaid_derived') - $overdue_schedules->sum('fees_waived_derived');
                                        $penalties_overdue = $overdue_schedules->sum('penalties') - $overdue_schedules->sum('penalties_written_off_derived') - $overdue_schedules->sum('penalties_repaid_derived') - $overdue_schedules->sum('penalties_waived_derived');
                                        $arrears_days = $arrears_days + \Illuminate\Support\Carbon::today()->diffInDays(\Illuminate\Support\Carbon::parse($overdue_schedules->sortBy('due_date')->first()->due_date));
                                    }

                                    $principal_outstanding = $principal - $principal_waived - $principal_paid - $principal_written_off;
                                    $interest_outstanding = $interest - $interest_waived - $interest_paid - $interest_written_off;
                                    $fees_outstanding = $fees - $fees_waived - $fees_paid - $fees_written_off;
                                    $penalties_outstanding = $penalties - $penalties_waived - $penalties_paid - $penalties_written_off;
                                    $balance = $principal_outstanding + $interest_outstanding + $fees_outstanding + $penalties_outstanding;
                                    $arrears_amount = $principal_overdue + $interest_overdue + $fees_overdue + $penalties_overdue;
                                    }

                           $bal =(int)$balance - (int)$amount;

                           //exit;

                            $b = 0;
                            if((int)$bal < 0 ){
                                $b =0;
                            }else{
                                $b =$bal;
                            }


                        if((int)$b > 0 || (int)$b == 0 ){

                        if((int)$amount > (int)$balance ){

                            //echo abs($bal);exit;
                             $bal1 =(int)$amount - abs($bal);
                    
                             $this->update_wallets($client->mobile,abs($bal),$trans_code,$client->mobile);
                             $this->repayment($phone,$bal1,$trans_code,$loan->id);

                        //if($bal1){
                            DB::table('loans')->where('id', $loan->id)->update(['status' =>'closed']);
                            $q = DB::select("SELECT * FROM loan_guarantors  WHERE loan_id = ".$loan->id." ");
                                  if($q){
                                    DB::table('loan_guarantors')->where('loan_id', $loan->id)->update(['status' =>'closed']);

                                  }
                           //}
                       } else if((int)$amount  == (int)$bal ){
                          //echo abs($bal);exit;

                            $this->repayment($phone,$amount,$trans_code,$loan->id);
                            $q = DB::select("SELECT * FROM loan_guarantors  WHERE loan_id = ".$loan->id." ");
                             if($q){
                            DB::table('loan_guarantors')->where('loan_id', $loan->id)->update(['status' =>'closed']);

                          }
                          DB::table('loans')->where('id', $loan->id)->update(['status' =>'closed']);
                        
                        }else{
                            //echo $trans_code;
                              //echo abs($bal);exit;
                             $this->repayment($phone,$amount,$trans_code,$loan->id);
                         
                        }


                    }else{
                        $this->update_wallets($client->mobile,$amount,$trans_code,$client->mobile);

                    }
                 

                }else{
                     $this->update_wallets($phone,$amount,$trans_code,$msisdn);

                }

    
   }


   public function repayment($phone,$amount,$trans_code,$id)
    {
    
        $loan = Loan::with('loan_product')->find($id);
        //payment details
        $payment_detail = new PaymentDetail();
    
        //print_r($payment_detail)exit;
        $payment_detail->created_by_id = 0;
        $payment_detail->payment_type_id = 3;
        $payment_detail->transaction_type = 'loan_transaction';
        $payment_detail->cheque_number = $trans_code;
        $payment_detail->receipt = $trans_code;
        $payment_detail->account_number = $phone;
        $payment_detail->bank_name = 'MPESA';
        $payment_detail->routing_code = 'N/A';
        $payment_detail->description = 'Repayment';
        $payment_detail->save();
        $loan_transaction = new LoanTransaction();
        $loan_transaction->created_by_id = 0;
        $loan_transaction->loan_id = $loan->id;
        $loan_transaction->payment_detail_id = $payment_detail->id;
        $loan_transaction->name = 'repayment';
        $loan_transaction->loan_transaction_type_id = 2;
        $loan_transaction->submitted_on = date("Y-m-d");
        $loan_transaction->created_on = date("Y-m-d");
        $loan_transaction->amount = (int)$amount;
        $loan_transaction->credit = (int)$amount;
        $loan_transaction->save();
        // activity()->on($loan_transaction)
        //     ->withProperties(['id' => $loan_transaction->id])
        //     ->log('Create Loan Repayment');
        //fire transaction updated event
       event(new TransactionUpdated($loan));
        echo'{"ResultCode":1,"ResultDesc":"Updated  successfully"}';
       
    }

     public function update_wallets($phone,$amount,$trans_code,$msisdn)
    {

      if($this->getWallet($phone)){
        
         $wallet = $this->getWallet($phone);
         //updadte both wallets user and company wallets
          $current = (int)$wallet->balance + (int)$amount;
          //$wallet_core = (int)$this->getWallet(20220104)->balance +(int)$amount;
          LoanWallets::where('AccountID',$phone)->update(['balance'=>$current]);
             //Log::info('RECEIVED TRANSAMOUNT: '.$transamount);
        
        DB::insert('INSERT INTO wallet_history
                    ( 
                    from_id,
                    to_id,
                    trans_amount,
                    sender_bal,
                    receiver_bal,
                    trans_code,
                    rate,
                    transacted_by,
                    created_at
                    ) values (?, ?, ?, ?, ?, ?, ?,?,?)',
                    [$phone, 
                    $phone, 
                    $amount, 
                    $current, 
                    $current, 
                    $trans_code, 
                    0,
                    $msisdn, 
                    date("Y-m-d H:i:s")
                   ] );


         // LoanWallets::where('CustomerID',20220104)->update(['balance'=>$wallet_core]);
         }else{
            date_default_timezone_set("Africa/Nairobi");
                // $current =(int)$wallet->balance -(int)$this->getRates($request->applied_amount);
                $wallet = new LoanWallets();
                $wallet->CustomerID = '';
                $wallet->balance =  $amount;
                $wallet->AccountID = $phone;
                $wallet->created_on = date("Y-m-d h:i:s");
                $wallet->updated_at = date("Y-m-d h:i:s");
                $wallet->save();
         }

    }




    public function getWallet($id)
          {
            $record =LoanWallets::where('AccountID', $id)->first();
                return $record;
            
         }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {

        $savings = Savings::with('transactions')->with('charges')->with('client')->with('savings_product')->find($id);
        if ($savings->client_id != session('client_id')) {
            Flash::warning(trans('core::general.permission_denied'));
            return redirect()->back();
        }
        return theme_view('portal::savings.show', compact('savings'));
    }
    //transactions
    public function show_transaction($id)
    {
        $savings_transaction = SavingsTransaction::with('payment_detail')->with('savings')->find($id);
        return theme_view('portal::savings.savings_transaction.show', compact('savings_transaction'));
    }

    public function pdf_transaction($id)
    {
        $savings_transaction = SavingsTransaction::with('payment_detail')->with('savings')->find($id);
        $pdf = PDF::loadView('portal::savings.savings_transaction.pdf', compact('savings_transaction'));
        return $pdf->download(trans_choice('savings::general.transaction', 1) . ' ' . trans_choice('core::general.detail', 2) . ".pdf");
    }

    public function print_transaction($id)
    {
        $savings_transaction = SavingsTransaction::with('payment_detail')->with('savings')->find($id);
        return theme_view('portal::savings.savings_transaction.print', compact('savings_transaction'));
    }
    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return theme_view('portal::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
