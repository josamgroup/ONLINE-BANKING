<?php

namespace App\Console\Commands;

use App\Helpers\GeneralHelper;
use App\Models\Email;
use App\Models\LoanSchedule;
//use App\Models\Setting;
use App\Models\Sms;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use AfricasTalking\SDK\AfricasTalking;
use Modules\Loan\Entities\Loan;
use Illuminate\Console\Scheduling\Schedule;

class ProcessReminders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reminders:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send reminder emails and sms';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
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

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->get_arreas();
        //     $campaigns = DB::select("SELECT * FROM communication_campaigns WHERE status ='active' ");
            
        //    // \Log::info($campaigns);
        //     foreach ($campaigns as $value) {
        //     	 if($value->communication_campaign_business_rule_id == 4){
        //     	 	$this->get_arreas();

        //    //\Log::info($this->get_arreas());


        //     }
    	  
        // }
    }

        public function get_arreas(){
        	 $loans = DB::select("SELECT * FROM loans WHERE status ='active' ");
          
            $data =[];
            // \Log::info('heree cron excec');
            foreach ($loans as $key => $value) {

         $loan = Loan::with('repayment_schedules')->with('transactions')->with('charges')->with('client')->with('loan_product')->with('notes')->with('guarantors')->with('files')->with('collateral')->with('collateral.collateral_type')->with('notes.created_by')->find($value->id);

       
         $client = $loan->client;
         //echo $client->first_name;
         if($loan->status=='active' ){
                                
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
                               
                                    // // print_r($arrears_last_schedule);
                                    //  echo "<pre>";
                                    //  print_r($arrears_last_schedule->due_date);
                                    if (!empty($arrears_last_schedule)) {
                                        $due = $arrears_last_schedule->due_date;
                                        $overdue_schedules = $loan->repayment_schedules->where('due_date', '<=', $arrears_last_schedule->due_date);
                                        $principal_overdue = $overdue_schedules->sum('principal') - $overdue_schedules->sum('principal_written_off_derived') - $overdue_schedules->sum('principal_repaid_derived');
                                        $interest_overdue = $overdue_schedules->sum('interest') - $overdue_schedules->sum('interest_written_off_derived') - $overdue_schedules->sum('interest_repaid_derived') - $overdue_schedules->sum('interest_waived_derived');
                                        $fees_overdue = $overdue_schedules->sum('fees') - $overdue_schedules->sum('fees_written_off_derived') - $overdue_schedules->sum('fees_repaid_derived') - $overdue_schedules->sum('fees_waived_derived');
                                        $penalties_overdue = $overdue_schedules->sum('penalties') - $overdue_schedules->sum('penalties_written_off_derived') - $overdue_schedules->sum('penalties_repaid_derived') - $overdue_schedules->sum('penalties_waived_derived');
                                        $arrears_days = $arrears_days + \Illuminate\Support\Carbon::today()->diffInDays(\Illuminate\Support\Carbon::parse($overdue_schedules->sortBy('due_date')->first()->due_date));
                                    }else{
                                        $due =date("Y-m-d");
                                    }

                                    $principal_outstanding = $principal - $principal_waived - $principal_paid - $principal_written_off;
                                    $interest_outstanding = $interest - $interest_waived - $interest_paid - $interest_written_off;
                                    $fees_outstanding = $fees - $fees_waived - $fees_paid - $fees_written_off;
                                    $penalties_outstanding = $penalties - $penalties_waived - $penalties_paid - $penalties_written_off;
                                    $balance = $principal_outstanding + $interest_outstanding + $fees_outstanding + $penalties_outstanding;
                                    $arrears_amount = $principal_overdue + $interest_overdue + $fees_overdue + $penalties_overdue;


                               // $data2 = array(
                               //  'client'=>$client->first_name.' '.$client->last_name,
                               //  'mobile'=>$client->mobile,
                               //  'arreas_days'=>$arrears_days,
                               //  'due_date'=>$due,
                               //  'principal_outstanding' =>$principal_outstanding ,
                               //  'interest_outstanding'=>$interest_outstanding,
                               //  'fees_outstanding'=>$fees_outstanding,
                               //  'penalties_outstanding'=>$penalties_outstanding,
                               //  'balance'=>$balance


                               //   );
                               if($arrears_days > 0){
                               	$m = 'was due on '.$due.' days in arrears '.$arrears_days.' ';

                               }else{
                                 $m ='is due  on '.$due.' days in arrears '.$arrears_days.' ';
                               }

                               $msg ='Dear '.$client->first_name.' '.$client->last_name.' your loan  of  Kshs. '.$balance.'  '.$m.', Please make your payment through our paybill. paybill number 4091083 Account your phone number. Thank You. ';

                              
                               //$this->sendSms('+'.$client->mobile, $msg);
                                \Log::info($msg);
                               //array_push($data,$data2);

                               }

                                //\Log::info($data2);
                         

                           // echo "<pre>";
                           // \Log::info($msg);


                           }
                          
        }
    
}
