<?php

namespace Modules\Payroll\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Laracasts\Flash\Flash;
use Modules\Branch\Entities\Branch;
use Modules\Core\Entities\Currency;
use Modules\Payroll\Entities\Payroll;
use Modules\Payroll\Entities\PayrollItem;
use Modules\Payroll\Entities\PayrollItemMeta;
use Modules\Payroll\Entities\PayrollPayment;
use Modules\Payroll\Entities\PayrollTemplate;
use Modules\User\Entities\User;
use Yajra\DataTables\Facades\DataTables;
use AfricasTalking\SDK\AfricasTalking;
use PDF;

class PayrollController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:payroll.payroll.index'])->only(['index', 'show', 'get_payroll']);
        $this->middleware(['permission:payroll.payroll.create'])->only(['create', 'store']);
        $this->middleware(['permission:payroll.payroll.edit'])->only(['edit', 'update']);
        $this->middleware(['permission:payroll.payroll.destroy'])->only(['destroy']);

    }

    /**
     * Display a listing of the resource.
     * @return Response
     */

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
    public function index(Request $request)
    {
        $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        $search = $request->s;
        $data = Payroll::leftJoin("branches", "branches.id", "payroll.branch_id")
            ->leftJoin("payroll_payments", "payroll_payments.payroll_id", "payroll.id")
            ->leftJoin("users", "users.id", "payroll.user_id")
            ->leftJoin("payroll_templates", "payroll_templates.id", "payroll.payroll_template_id")
            ->when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
                $query->orderBy($orderBy, $orderByDir);
            })
            ->when($search, function (Builder $query) use ($search) {
                $query->where('id', 'like', "%$search%");
            })
            ->selectRaw("sum(payroll_payments.amount) payments,branches.name branch,concat(users.first_name,' ',users.last_name) user,payroll_templates.name payroll_template,payroll.*")
            ->groupBy('payroll.id')
            ->paginate($perPage)
            ->appends($request->input());
        return theme_view('payroll::payroll.index', compact('data'));
    }

    public function get_payroll(Request $request)
    {

        $user_id = $request->user_id;
        $query = DB::table("payroll")->leftJoin("branches", "branches.id", "payroll.branch_id")
            ->leftJoin("payroll_payments", "payroll_payments.payroll_id", "payroll.id")
            ->leftJoin("users", "users.id", "payroll.user_id")
            ->leftJoin("payroll_templates", "payroll_templates.id", "payroll.payroll_template_id")
            ->selectRaw("sum(payroll_payments.amount) payments,branches.name branch,concat(users.first_name,' ',users.last_name) user,payroll_templates.name payroll_template,payroll.*")
            ->when($user_id, function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })->groupBy('payroll.id');
        return DataTables::of($query)->editColumn('work_duration', function ($data) {
            return number_format($data->work_duration, 2);
        })->editColumn('amount_per_duration', function ($data) {
            return number_format($data->amount_per_duration, 2);
        })->editColumn('total_duration_amount', function ($data) {
            return number_format($data->total_duration_amount, 2);
        })->editColumn('gross_amount', function ($data) {
            return number_format($data->gross_amount, 2);
        })->editColumn('total_allowances', function ($data) {
            return number_format($data->total_allowances, 2);
        })->editColumn('total_deductions', function ($data) {
            return number_format($data->total_deductions, 2);
        })->editColumn('payments', function ($data) {
            return number_format($data->payments, 2);
        })->editColumn('payment_status', function ($data) {
            if ($data->payments >= $data->gross_amount) {
                return '<span class="label label-success">' . trans_choice('payroll::general.paid', 1) . '</span>';
            } elseif ($data->payments < $data->gross_amount && $data->payments > 0) {
                return '<span class="label label-warning">' . trans_choice('payroll::general.partially_paid', 1) . '</span>';
            } else {
                return '<span class="label label-danger">' . trans_choice('payroll::general.unpaid', 1) . '</span>';
            }
        })->editColumn('recurring', function ($data) {
            if ($data->recurring == 1) {
                return trans_choice('core::general.yes', 1);
            }
            if ($data->recurring == 0) {
                return trans_choice('core::general.no', 1);
            }
        })->editColumn('action', function ($data) {
            $action = '<div class="btn-group"><button type="button" class="btn btn-info btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-navicon"></i></button> <ul class="dropdown-menu dropdown-menu-right" role="menu">';
            $action .= '<li><a href="' . url('payroll/' . $data->id . '/show') . '" class="">' . trans_choice('core::general.detail', 2) . '</a></li>';
            if (Auth::user()->hasPermissionTo('payroll.payroll.edit')) {
                $action .= '<li><a href="' . url('payroll/' . $data->id . '/edit') . '" class="">' . trans_choice('core::general.edit', 2) . '</a></li>';
            }
            if (Auth::user()->hasPermissionTo('payroll.payroll.destroy')) {
                $action .= '<li><a href="' . url('payroll/' . $data->id . '/destroy') . '" class="confirm">' . trans_choice('core::general.delete', 2) . '</a></li>';
            }
            $action .= "</ul></li></div>";
            return $action;
        })->editColumn('id', function ($data) {
            return '<a href="' . url('payroll/' . $data->id . '/show') . '">' . $data->id . '</a>';

        })->editColumn('user', function ($data) {
            return '<a href="' . url('user/' . $data->id . '/show') . '">' . $data->user . '</a>';

        })->rawColumns(['id', 'payment_status', 'user', 'action'])->make(true);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        $users = User::whereHas('roles', function ($query) {
            return $query->where('name', '!=', 'client');
        })->get();
        $payroll_templates = PayrollTemplate::with('payroll_items')->get();
        $payroll_items = PayrollItem::get();
        $branches = Branch::get();
        $currencies = Currency::all();
        \JavaScript::put([
            'allowances' => $payroll_items->where('type', 'allowance')->groupBy('id'),
            'deductions' => $payroll_items->where('type', 'deduction')->groupBy('id'),
            'payroll_items' => $payroll_items->groupBy('id'),
            'original_payroll_items' => $payroll_items,
            'payroll_templates' => $payroll_templates->groupBy('id'),
            'branches' => $branches,
            'currencies' => $currencies,
            'users' => $users,
        ]);

        return theme_view('payroll::payroll.create', compact('users', 'payroll_templates', 'payroll_items', 'branches', 'currencies'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'payroll_template_id'=>['required'],
            'user_id'=>['required'],
            //'payment_type_id'=>['required'],

        ]);
        //print_r($request);exit;
        $payroll = new Payroll();
        $payroll->payroll_template_id = $request->payroll_template_id;
        $user = User::find($request->user_id);
        $payroll->created_by_id = Auth::id();
        $payroll->user_id = $request->user_id;
        $payroll->branch_id = $request->branch_id;
        $payroll->currency_id = $request->currency_id;
        $payroll->work_duration = $request->work_duration;
        $payroll->employee_name = $user->first_name . ' ' . $user->last_name;
        $payroll->duration_unit = $request->duration_unit;
        $payroll->amount_per_duration = $request->amount_per_duration;
        $payroll->total_duration_amount = $request->amount_per_duration * $request->work_duration;
        $payroll->bank_name = $request->bank_name;
        $payroll->account_number = $request->account_number;
        $payroll->description = $request->description;
        $payroll->recurring = $request->recurring;
        if ($request->recurring == 1) {
            $payroll->recur_frequency = $request->recur_frequency;
            $payroll->recur_start_date = $request->recur_start_date;
            $payroll->recur_end_date = $request->recur_end_date;
            $payroll->recur_next_date = $request->recur_start_date;
            $payroll->recur_type = $request->recur_type;
        }
        $payroll->date = $request->date;
        $date = explode('-', $request->date);
        $payroll->month = $date[1];
        $payroll->year = $date[0];
        $payroll->save();
        $items_count = count($request->payroll_items['id']);
        $gross_amount = $payroll->total_duration_amount;
        $total_allowances = 0;
        $total_deductions = 0;
        for ($i = 0; $i < $items_count; $i++) {
            $payroll_item_meta = new PayrollItemMeta();
            $payroll_item_meta->payroll_id = $payroll->id;
            $payroll_item_meta->payroll_item_id = $request->payroll_items['id'][$i];
            $payroll_item_meta->amount = $request->payroll_items['amount'][$i];
            $payroll_item_meta->amount_type = $request->payroll_items['amount_type'][$i];
            $payroll_item_meta->type = $request->payroll_items['type'][$i];
            $payroll_item_meta->name = $request->payroll_items['name'][$i];
            $payroll_item_meta->save();
            if ($payroll_item_meta->type == 'allowance') {
                if ($payroll_item_meta->amount_type == 'fixed') {
                    $total_allowances = $total_allowances + $payroll_item_meta->amount;
                    $gross_amount = $gross_amount + $payroll_item_meta->amount;
                }
                if ($payroll_item_meta->amount_type == 'percentage') {
                    $total_allowances = $total_allowances + ($gross_amount * $payroll_item_meta->amount) / 100;
                    $gross_amount = $gross_amount + ($gross_amount * $payroll_item_meta->amount) / 100;
                }
            }
            if ($payroll_item_meta->type == 'deduction') {
                if ($payroll_item_meta->amount_type == 'fixed') {
                    $total_deductions = $total_deductions + $payroll_item_meta->amount;
                    $gross_amount = $gross_amount - $payroll_item_meta->amount;
                }
                if ($payroll_item_meta->amount_type == 'percentage') {
                    $total_deductions = $total_deductions + ($gross_amount * $payroll_item_meta->amount) / 100;
                    $gross_amount = $gross_amount - ($gross_amount * $payroll_item_meta->amount) / 100;
                }
            }
        }
        $payroll->gross_amount = $gross_amount;
        $payroll->total_allowances = $total_allowances;
        $payroll->total_deductions = $total_deductions;

        $payroll->save();
      
        // $msg ="Dear ".$user->first_name . ' ' . $user->last_name." your salary  of ".(int)$request->amount." has been processed.Thank you for being our valued employee.";
        //  $this->sendSms($user->mobile,$msg);

        //  if((int)$request->payment_type_id === 3){
        //     echo (int)$request->amount;
        //     echo $user->phone;
        //    exit();
        //     //$this->b2c($user->phone,(int)$request->amount);
        // }
       
        activity()->on($payroll)
            ->withProperties(['id' => $payroll->id])
            ->log('Create Payroll');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('payroll');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        $payroll = Payroll::with('payroll_items')->with('payroll_payments')->find($id);
        $payments = PayrollPayment::where('payroll_id', $id)->sum('amount');
        $balance = $payroll->gross_amount - $payments;
        return theme_view('payroll::payroll.show', compact('payroll', 'balance', 'payments'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $users = User::whereHas('roles', function ($query) {
            return $query->where('name', '!=', 'client');
        })->get();
        $payroll_templates = PayrollTemplate::with('payroll_items')->get();
        $payroll_items = PayrollItem::get();
        $branches = Branch::get();
        $currencies = Currency::all();
        $payroll = Payroll::with('payroll_items')->find($id);
        $selected_allowances = [];
        $selected_deductions = [];
        foreach ($payroll->payroll_items as $payroll_item) {
            if ($payroll_item->type == 'deduction') {
                $selected_deductions[] = $payroll_item;
            }
            if ($payroll_item->type == 'allowance') {
                $selected_allowances[] = $payroll_item;
            }
        }
        \JavaScript::put([
            'allowances' => $payroll_items->where('type', 'allowance')->groupBy('id'),
            'deductions' => $payroll_items->where('type', 'deduction')->groupBy('id'),
            'payroll_items' => $payroll_items->groupBy('id'),
            'original_payroll_items' => $payroll_items,
            'payroll_templates' => $payroll_templates->groupBy('id'),
            'selected_allowances' => $selected_allowances,
            'selected_deductions' => $selected_deductions,
            'branches' => $branches,
            'currencies' => $currencies,
            'users' => $users,
        ]);

        return theme_view('payroll::payroll.edit', compact('users', 'payroll_templates', 'payroll_items', 'payroll', 'branches', 'currencies'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $payroll = Payroll::find($id);
        $payroll->payroll_template_id = $request->payroll_template_id;
        $user = User::find($request->user_id);
        $payroll->user_id = $request->user_id;
        $payroll->branch_id = $request->branch_id;
        $payroll->currency_id = $request->currency_id;
        $payroll->work_duration = $request->work_duration;
        $payroll->employee_name = $user->first_name . ' ' . $user->last_name;
        $payroll->duration_unit = $request->duration_unit;
        $payroll->amount_per_duration = $request->amount_per_duration;
        $payroll->total_duration_amount = $request->amount_per_duration * $request->work_duration;
        $payroll->bank_name = $request->bank_name;
        $payroll->account_number = $request->account_number;
        $payroll->description = $request->description;
        $payroll->recurring = $request->recurring;
        if ($request->recurring == 1) {
            $payroll->recur_frequency = $request->recur_frequency;
            $payroll->recur_start_date = $request->recur_start_date;
            $payroll->recur_end_date = $request->recur_end_date;
            $payroll->recur_next_date = $request->recur_next_date;
            $payroll->recur_type = $request->recur_type;
        }
        $payroll->date = $request->date;
        $date = explode('-', $request->date);
        $payroll->month = $date[1];
        $payroll->year = $date[0];
        PayrollItemMeta::where('payroll_id', $id)->delete();
        $items_count = count($request->payroll_items['id']);
        $gross_amount = $payroll->total_duration_amount;
        $total_allowances = 0;
        $total_deductions = 0;
        for ($i = 0; $i < $items_count; $i++) {
            $payroll_item_meta = new PayrollItemMeta();
            $payroll_item_meta->payroll_id = $payroll->id;
            $payroll_item_meta->payroll_item_id = $request->payroll_items['id'][$i];
            $payroll_item_meta->amount = $request->payroll_items['amount'][$i];
            $payroll_item_meta->amount_type = $request->payroll_items['amount_type'][$i];
            $payroll_item_meta->type = $request->payroll_items['type'][$i];
            $payroll_item_meta->name = $request->payroll_items['name'][$i];
            $payroll_item_meta->save();
            if ($payroll_item_meta->type == 'allowance') {
                if ($payroll_item_meta->amount_type == 'fixed') {
                    $total_allowances = $total_allowances + $payroll_item_meta->amount;
                    $gross_amount = $gross_amount + $payroll_item_meta->amount;
                }
                if ($payroll_item_meta->amount_type == 'percentage') {
                    $total_allowances = $total_allowances + ($gross_amount * $payroll_item_meta->amount) / 100;
                    $gross_amount = $gross_amount + ($gross_amount * $payroll_item_meta->amount) / 100;
                }
            }
            if ($payroll_item_meta->type == 'deduction') {
                if ($payroll_item_meta->amount_type == 'fixed') {
                    $total_deductions = $total_deductions + $payroll_item_meta->amount;
                    $gross_amount = $gross_amount - $payroll_item_meta->amount;
                }
                if ($payroll_item_meta->amount_type == 'percentage') {
                    $total_deductions = $total_deductions + ($gross_amount * $payroll_item_meta->amount) / 100;
                    $gross_amount = $gross_amount - ($gross_amount * $payroll_item_meta->amount) / 100;
                }
            }
        }
        $payroll->gross_amount = $gross_amount;
        $payroll->total_allowances = $total_allowances;
        $payroll->total_deductions = $total_deductions;
        $payroll->save();
        activity()->on($payroll)
            ->withProperties(['id' => $payroll->id])
            ->log('Update Payroll');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('payroll');

    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        $payroll = Payroll::find($id);
        $payroll->delete();
        PayrollItemMeta::where('payroll_id', $id)->delete();
        activity()->on($payroll)
            ->withProperties(['id' => $payroll->id])
            ->log('Delete Payroll');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }

    public function pdf_payroll($id)
    {
        $payroll = Payroll::with('payroll_items')->with('payroll_payments')->find($id);
        $payments = PayrollPayment::where('payroll_id', $id)->sum('amount');
        $balance = $payroll->gross_amount - $payments;
        $pdf = PDF::loadView('payroll::payroll.pdf', compact('payments', 'payroll', 'balance'));
        return $pdf->download(trans_choice('payroll::general.payroll', 1) . ' #' . $payroll->id . ".pdf");
    }

    public function print_payroll($id)
    {
        $payroll = Payroll::with('payroll_items')->with('payroll_payments')->find($id);
        $payments = PayrollPayment::where('payroll_id', $id)->sum('amount');
        $balance = $payroll->gross_amount - $payments;
        return theme_view('payroll::payroll.print', compact('payments', 'payroll', 'balance'));
    }
}
