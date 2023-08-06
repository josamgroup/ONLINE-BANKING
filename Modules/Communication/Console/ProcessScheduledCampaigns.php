<?php

namespace Modules\Communication\Console;

use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Mail;
use Modules\Client\Entities\Client;
use Modules\Communication\Entities\CommunicationCampaign;
use Modules\Loan\Entities\Loan;
use Modules\Loan\Entities\LoanRepaymentSchedule;
use Modules\Setting\Entities\Setting;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use PDF;

class ProcessScheduledCampaigns extends Command
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'campaigns:process';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Processes Scheduled Commands';

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
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $campaigns = CommunicationCampaign::where('trigger_type', 'schedule')->where('status', 'active')->where(function ($query) {
            $query->where(function ($query) {
                $query->where('scheduled_date', date("Y-m-d"));
                //$query->where('scheduled_time', date("H:i"));
            });
        })->get();
        //
        foreach ($campaigns as $key) {
            $branch_id = $key->branch_id;
            $loan_officer_id = $key->loan_officer_id;
            $loan_product_id = $key->loan_product_id;
            $attachment_type = $key->communication_campaign_attachment_type_id;
            $from_x = $key->from_x;
            $to_y = $key->to_y;
            $cycle_x = $key->cycle_x;
            $cycle_y = $key->cycle_y;
            $overdue_x = $key->overdue_x;
            $overdue_y = $key->overdue_y;
            //active clients
            if ($key->communication_campaign_business_rule_id == 1) {
                $clients = Client::where('status', 'active')->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('branch_id', $branch_id);
                })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('loan_officer_id', $loan_officer_id);
                })->get();
                foreach ($clients as $client) {
                    if ($key->campaign_type == 'sms') {
                        if (!empty($client->mobile)) {
                            $description = template_replace_tags(["body" => $key->description, "client_id" => $client->id]);
                            send_sms($client->mobile, $description, $key->sms_gateway_id);
                            //log sms
                            log_campaign([
                                'client_id' => $client->id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $client->mobile,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                    if ($key->campaign_type == 'email') {
                        if (!empty($client->email)) {
                            $description = template_replace_tags(["body" => $key->description, "client_id" => $client->id]);
                            $email = $client->email;
                            $subject = $key->subject;
                            Mail::send([], [], function ($message) use ($email, $description, $subject) {
                                $message->subject($subject);
                                $message->setBody($description);
                                $message->from(Setting::where('setting_key', 'core.company_email')->first()->setting_value, Setting::where('setting_key', 'core.company_name')->first()->setting_value);
                                $message->to($email);
                            });
                            //log sms
                            log_campaign([
                                'client_id' => $client->id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $client->email,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                }
            }
            //active clients who have never had a loan
            if ($key->communication_campaign_business_rule_id == 2) {
                $clients = Client::leftJoin("loans", "clients.id", "loans.client_id")->where('clients.status', 'active')->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('clients.branch_id', $branch_id);
                })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('clients.loan_officer_id', $loan_officer_id);
                })->selectRaw("clients.*,count(loans.id) loan_count")->having('loan_count', 0)->get();
                foreach ($clients as $client) {
                    if ($key->campaign_type == 'sms') {
                        if (!empty($client->mobile)) {
                            $description = template_replace_tags(["body" => $key->description, "client_id" => $client->id]);
                            send_sms($client->mobile, $description, $key->sms_gateway_id);
                            //log sms
                            log_campaign([
                                'client_id' => $client->id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $client->mobile,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                    if ($key->campaign_type == 'email') {
                        if (!empty($client->email)) {
                            $description = template_replace_tags(["body" => $key->description, "client_id" => $client->id]);
                            $email = $client->email;
                            $subject = $key->subject;
                            Mail::send([], [], function ($message) use ($email, $description, $subject) {
                                $message->subject($subject);
                                $message->setBody($description);
                                $message->from(Setting::where('setting_key', 'core.company_email')->first()->setting_value, Setting::where('setting_key', 'core.company_name')->first()->setting_value);
                                $message->to($email);
                            });
                            //log sms
                            log_campaign([
                                'client_id' => $client->id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $client->email,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                }
            }
            //all clients with an outstanding loan
            if ($key->communication_campaign_business_rule_id == 3) {
                $clients = Client::leftJoin("loans", "clients.id", "loans.client_id")->where('clients.status', 'active')->where('loans.status', 'active')->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('clients.branch_id', $branch_id);
                })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('clients.loan_officer_id', $loan_officer_id);
                })->when($loan_product_id, function ($query) use ($loan_product_id) {
                    $query->where('loans.loan_product_id', $loan_product_id);
                })->selectRaw("clients.*,count(loans.id) loan_count")->having('loan_count', '>', 0)->get();
                foreach ($clients as $client) {
                    if ($key->campaign_type == 'sms') {
                        if (!empty($client->mobile)) {
                            $description = template_replace_tags(["body" => $key->description, "client_id" => $client->id]);
                            send_sms($client->mobile, $description, $key->sms_gateway_id);
                            //log sms
                            log_campaign([
                                'client_id' => $client->id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $client->mobile,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                    if ($key->campaign_type == 'email') {
                        if (!empty($client->email)) {
                            $description = template_replace_tags(["body" => $key->description, "client_id" => $client->id]);
                            $email = $client->email;
                            $subject = $key->subject;
                            Mail::send([], [], function ($message) use ($email, $description, $subject) {
                                $message->subject($subject);
                                $message->setBody($description);
                                $message->from(Setting::where('setting_key', 'core.company_email')->first()->setting_value, Setting::where('setting_key', 'core.company_name')->first()->setting_value);
                                $message->to($email);
                            });
                            //log sms
                            log_campaign([
                                'client_id' => $client->id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $client->email,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                }
            }
            //all clients with loans in arrears
            if ($key->communication_campaign_business_rule_id == 4) {
                $loans = LoanRepaymentSchedule::join("loans", "loans.id", "loan_repayment_schedules.loan_id")->leftJoin("clients", "clients.id", "loans.client_id")->where('loans.status', 'active')->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('loans.branch_id', $branch_id);
                })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('loans.loan_officer_id', $loan_officer_id);
                })->when($loan_product_id, function ($query) use ($loan_product_id) {
                    $query->where('loans.loan_product_id', $loan_product_id);
                })->when($from_x, function ($query) use ($from_x, $to_y) {
                    $query->havingRaw("days_in_arrears between $from_x AND $to_y");
                })->whereRaw("loan_repayment_schedules.id =(select lrs.id from loan_repayment_schedules as lrs where lrs.due_date<now() AND lrs.loan_id=loan_repayment_schedules.loan_id AND lrs.total_due > 0 order by due_date desc limit 1)")->selectRaw("loans.client_id,loans.id,clients.mobile,clients.email,clients.first_name,clients.last_name,datediff(now(),loan_repayment_schedules.due_date) days_in_arrears")->get();
            


                foreach ($loans as $loan) {

                  
                    if ($key->campaign_type == 'sms') {
                        

                           // \Log::info( $this->get_arreas($loan->id,$loan->client_id));

                        if (!empty($loan->mobile)) {
                            $description = template_replace_tags(["body" => $this->get_arreas($loan->id,$loan->client_id), "loan_id" => $loan->id, "client_id" => $loan->client_id]);
                            send_sms($loan->mobile, $this->get_arreas($loan->id,$loan->client_id), $key->sms_gateway_id);
                            //log sms
                            log_campaign([
                                'client_id' => $loan->client_id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $this->get_arreas($loan->id,$loan->client_id),
                                'send_to' => $loan->mobile,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                    if ($key->campaign_type == 'email') {
                        if (!empty($loan->email)) {
                            $description = template_replace_tags(["body" => $key->description, "loan_id" => $loan->id, "client_id" => $loan->client_id]);
                            $email = $loan->email;
                            $subject = $key->subject;
                            Mail::send([], [], function ($message) use ($email, $description, $subject, $attachment_type, $loan) {
                                $message->subject($subject);
                                $message->setBody($description);
                                $message->from(Setting::where('setting_key', 'core.company_email')->first()->setting_value, Setting::where('setting_key', 'core.company_name')->first()->setting_value);
                                $message->to($email);
                                if ($attachment_type == '1') {
                                    //loan schedule
                                    $loan = Loan::find($loan->id);
                                    $pdf = PDF::loadView('loan::loan_schedule.pdf', compact('loan'))->setPaper('a4', 'landscape');
                                    $message->attachData($pdf->output(),
                                        trans_choice('loan::general.loan', 1) . ' ' . trans_choice('loan::general.schedule', 1) . ".pdf",
                                        ['mime' => 'application/pdf']);
                                }
                            });
                            //log sms
                            log_campaign([
                                'client_id' => $loan->client_id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $loan->email,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                }
            }
            //loans disbursed to clients
            if ($key->communication_campaign_business_rule_id == 5) {
                $loans = Loan::join("clients", "clients.id", "loans.client_id")->where('loans.status', 'active')->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('loans.branch_id', $branch_id);
                })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('loans.loan_officer_id', $loan_officer_id);
                })->when($loan_product_id, function ($query) use ($loan_product_id) {
                    $query->where('loans.loan_product_id', $loan_product_id);
                })->whereBetween('disbursed_on_date', [Carbon::today()->subDays($to_y)->format("Y-m-d"), Carbon::today()->subDays($from_x)->format("Y-m-d")])->selectRaw("loans.client_id,loans.id,clients.mobile,clients.email")->get();
                foreach ($loans as $loan) {
                    if ($key->campaign_type == 'sms') {
                        if (!empty($loan->mobile)) {
                            $description = template_replace_tags(["body" => $key->description, "loan_id" => $loan->id, "client_id" => $loan->client_id]);
                            send_sms($loan->mobile, $description, $key->sms_gateway_id);
                            //log sms
                            log_campaign([
                                'client_id' => $loan->client_id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $loan->mobile,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                    if ($key->campaign_type == 'email') {
                        if (!empty($loan->email)) {
                            $description = template_replace_tags(["body" => $key->description, "loan_id" => $loan->id, "client_id" => $loan->client_id]);
                            $email = $loan->email;
                            $subject = $key->subject;
                            Mail::send([], [], function ($message) use ($email, $description, $subject, $attachment_type, $loan) {
                                $message->subject($subject);
                                $message->setBody($description);
                                $message->from(Setting::where('setting_key', 'core.company_email')->first()->setting_value, Setting::where('setting_key', 'core.company_name')->first()->setting_value);
                                $message->to($email);
                                if ($attachment_type == '1') {
                                    //loan schedule
                                    $loan = Loan::find($loan->id);
                                    $pdf = PDF::loadView('loan::loan_schedule.pdf', compact('loan'))->setPaper('a4', 'landscape');
                                    $message->attachData($pdf->output(),
                                        trans_choice('loan::general.loan', 1) . ' ' . trans_choice('loan::general.schedule', 1) . ".pdf",
                                        ['mime' => 'application/pdf']);
                                }
                            });
                            //log sms
                            log_campaign([
                                'client_id' => $loan->client_id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $loan->email,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                }
            }
            //loan payments due
            if ($key->communication_campaign_business_rule_id == 6) {
                $loans = LoanRepaymentSchedule::join("loans", "loans.id", "loan_repayment_schedules.loan_id")->join("clients", "clients.id", "loans.client_id")->where('loans.status', 'active')->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('loans.branch_id', $branch_id);
                })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('loans.loan_officer_id', $loan_officer_id);
                })->when($loan_product_id, function ($query) use ($loan_product_id) {
                    $query->where('loans.loan_product_id', $loan_product_id);
                })->where('loan_repayment_schedules.total_due', '>', 0)->whereBetween('loan_repayment_schedules.due_date', [Carbon::today()->addDays($from_x)->format("Y-m-d"), Carbon::today()->addDays($to_y)->format("Y-m-d")])->selectRaw("loans.client_id,loans.id,clients.mobile,clients.email,loan_repayment_schedules.id loan_repayment_schedule_id")->get();
                foreach ($loans as $loan) {
                    if ($key->campaign_type == 'sms') {
                        if (!empty($loan->mobile)) {
                            $description = template_replace_tags(["body" => $key->description, "loan_id" => $loan->id, "client_id" => $loan->client_id, "loan_repayment_schedule_id" => $loan->loan_repayment_schedule_id]);
                            send_sms($loan->mobile, $description, $key->sms_gateway_id);
                            //log sms
                            log_campaign([
                                'client_id' => $loan->client_id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $loan->mobile,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                    if ($key->campaign_type == 'email') {
                        if (!empty($loan->email)) {
                            $description = template_replace_tags(["body" => $key->description, "loan_id" => $loan->id, "client_id" => $loan->client_id]);
                            $email = $loan->email;
                            $subject = $key->subject;
                            Mail::send([], [], function ($message) use ($email, $description, $subject, $attachment_type, $loan) {
                                $message->subject($subject);
                                $message->setBody($description);
                                $message->from(Setting::where('setting_key', 'core.company_email')->first()->setting_value, Setting::where('setting_key', 'core.company_name')->first()->setting_value);
                                $message->to($email);
                                if ($attachment_type == '1') {
                                    //loan schedule
                                    $loan = Loan::find($loan->id);
                                    $pdf = PDF::loadView('loan::loan_schedule.pdf', compact('loan'))->setPaper('a4', 'landscape');
                                    $message->attachData($pdf->output(),
                                        trans_choice('loan::general.loan', 1) . ' ' . trans_choice('loan::general.schedule', 1) . ".pdf",
                                        ['mime' => 'application/pdf']);
                                }
                            });
                            //log sms
                            log_campaign([
                                'client_id' => $loan->client_id,
                                'communication_campaign_id' => $key->id,
                                'campaign_type' => $key->campaign_type,
                                'description' => $description,
                                'send_to' => $loan->email,
                                'status' => 'sent',
                                'campaign_name' => $key->name
                            ]);
                        }
                    }
                }
            }

            if ($key->communication_campaign_business_rule_id == 31) {

                $curl = curl_init();

                curl_setopt_array($curl, array(
                  CURLOPT_URL => 'https://uat.josamgroup.com/api/v1/email',
                  CURLOPT_RETURNTRANSFER => true,
                  CURLOPT_ENCODING => '',
                  CURLOPT_MAXREDIRS => 10,
                  CURLOPT_TIMEOUT => 0,
                  CURLOPT_FOLLOWLOCATION => true,
                  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                  CURLOPT_CUSTOMREQUEST => 'GET',
                ));

                $response = curl_exec($curl);
                curl_close($curl);
                echo $response;

            }
            //check if we should move the schedule
            if (!empty($key->schedule_frequency) & !empty($key->schedule_frequency_type)) {
                $key->scheduled_date = Carbon::now()->add($key->schedule_frequency, $key->schedule_frequency_type)->format("Y-m-d");
                $key->scheduled_next_run_date = Carbon::now()->add($key->schedule_frequency, $key->schedule_frequency_type)->format("Y-m-d");
                $key->scheduled_last_run_date = Carbon::now()->format("Y-m-d");
                $key->save();
            }

        }
        $this->info("Schedule ran successfully");

    }


     public function get_arreas($id,$client_id){
             
          
            $data =[];
   

                   $loan = Loan::with('repayment_schedules')->with('transactions')->with('charges')->with('client')->with('loan_product')->with('notes')->with('guarantors')->with('files')->with('collateral')->with('collateral.collateral_type')->with('notes.created_by')->find($id);

                                   
                                     $client = $loan->client;

                           if($client->id == $client_id){
    
                                
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

                               $msg ='Dear '.$client->first_name.' '.$client->last_name.' your loan  of  Kshs. '.$balance.'  '.$m.', Please make your payment through our paybill. Paybill No. 4091083 and your Phone number as Account Number  . Thank You. ';

                               return $msg;

                           }else{
                            return '';
                           }

                            
                           
                          
        }


}
