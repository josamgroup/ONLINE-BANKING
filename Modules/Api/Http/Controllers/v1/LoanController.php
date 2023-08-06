<?php
namespace Modules\Api\Http\Controllers\v1;
//namespace Modules\Portal\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Laracasts\Flash\Flash;
use Modules\Client\Entities\Client;
use Modules\Core\Entities\PaymentDetail;
use Modules\Core\Entities\PaymentGateway;
use Modules\Core\Entities\PaymentType;
use Modules\CustomField\Entities\CustomField;
use Modules\Loan\Entities\Loan;
use Modules\Savings\Entities\Savings;
use Modules\Loan\Entities\LoanWallets;
use Modules\Loan\Entities\LoanApplication;
use Modules\Loan\Entities\LoanProduct;
use Modules\Loan\Entities\LoanTransaction;
use Modules\Loan\Events\TransactionUpdated;
use Yajra\DataTables\Facades\DataTables;
use Mail;
use PDF;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Branch\Entities\Branch;
use Modules\Loan\Exports\LoanExport;
use Modules\User\Entities\User;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;




class SendMail extends Mailable
{
    use Queueable, SerializesModels;

    public $testMailData;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($testMailData)
    {
        $this->testMailData = $testMailData;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Email From AllPHPTricks.com')
                    ->view('mail');
    }
}




class LoanController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response


     */

    public function dashboard(Request $request){



       $client = Client::find($request->client_id);


        $wallet_id = LoanWallets::where('CustomerID', '=', $request->client_id)->first();
           if ($wallet_id == null) {

             date_default_timezone_set("Africa/Nairobi");
                $current =0;
                $wallet = new LoanWallets();
                $wallet->CustomerID = $request->client_id;
                $wallet->balance =  $current;
                $wallet->AccountID = $client->phone;
                $wallet->created_on = date("Y-m-d h:i:s");
                $wallet->updated_at = date("Y-m-d h:i:s");
                $wallet->save();

         
            } 
      // echo $client->phone;exit;
       $totall = number_format(Loan::where('client_id',$request->client_id)->count());
       $disloan= number_format(Loan::where('status','active')->where('client_id',$request->client_id)->sum('principal'));
       $saving = number_format(Savings::where('client_id',$request->client_id)->count());
       $savingbal = number_format(Savings::where('client_id',$request->client_id)->sum('balance_derived'));
       $wallet =number_format(LoanWallets::where('AccountID',$client->phone)->sum('balance'));
        $data =array([
            "total_loans"=>$totall,
            "loan_disbursed"=>$disloan,
            "total_savings"=>$saving,
            "saving_balance"=>$savingbal,
            "wallet_balance"=>$wallet
        ]);
         return response()->json(['msg' => 'Success', 'status' => '200','data' => $data]);



    }


    public function registerurl(){

        //header("Content-Type:application/json");
        $consumerkey    ="UdQswl0DABs2VoGbmBmjKzpZdE28mbKo";
        $consumersecret ="NA6jIivf6FNnFZ36";
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

public function topup($phone,$amount,$type){
       
        date_default_timezone_set('Africa/Nairobi'); # add your city to set local time zone
        $BusinessShortCode = '4091083';
        $passkey='3360e339f381c721a01a23991e7ec419c86fb6cc9e2751aead97d7fc26f7f8f3';
        $time =date('YmdHis');

        $url = 'https://api.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
        $password = base64_encode($BusinessShortCode.$passkey.$time);
        echo $access_token = $this->registerurl();
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json','Authorization:Bearer '.$access_token.'')); 
        //echo $curl;exit;
        //setting custom header
        // $phone = $this->input->post('phone');
        // $amount = $this->input->post('amount');
        
        $curl_post_data = array(
        //Fill in the request parameters with valid values
        'BusinessShortCode' => $BusinessShortCode,
        'Password' =>$password,
        'Timestamp' => $time,
        'TransactionType' => 'CustomerPayBillOnline',
        'Amount' => round($amount, 0),
        'PartyA' =>$phone,
        'PartyB' => $BusinessShortCode,
        'PhoneNumber' =>$phone,
        'CallBackURL' => 'https://sacco.josamgroup.com/api/v1/callback',
        'AccountReference' =>'0'.substr($phone, 3),
        'TransactionDesc' => $type
        );
        
        $data_string = json_encode($curl_post_data);
        //print_r($data_string);exit;
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
        //echo $curl;
        $curl_response = curl_exec($curl);
        //print_r($curl_response);
        //return $curl_response;


   
        return response()->json(['msg' => 'Success', 'status' => '200','data' => json_decode($curl_response)]);



    }

       public function wallets(Request $request){
       $client = Client::find($request->client_id);
       $curl_response = $this->topup($client->phone,$request->amount,$request->type);
     
        return $curl_response;


   
         //return response()->json(['msg' => 'Success', 'status' => '200','data' => $data]);



    }
    public function index(Request $request)
    {
        $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        $search = $request->s;
        $status = $request->status;
        $loan_officer_id = $request->loan_officer_id;
        $branch_id = $request->branch_id;
        //exit();
        $data = Loan::leftJoin("clients", "clients.id", "loans.client_id")
            ->leftJoin("loan_repayment_schedules", "loan_repayment_schedules.loan_id", "loans.id")
            ->leftJoin("loan_products", "loan_products.id", "loans.loan_product_id")
            ->leftJoin("branches", "branches.id", "loans.branch_id")
            ->leftJoin("users", "users.id", "loans.loan_officer_id")
            ->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                $query->where("loans.loan_officer_id", $loan_officer_id);
            })
            ->when($branch_id, function ($query) use ($branch_id) {
                $query->where("loans.branch_id", $branch_id);
            })
            ->when($search, function (Builder $query) use ($search) {
                $query->where('loan_products.name', 'like', "%$search%");
                $query->orWhere('clients.first_name', 'like', "%$search%");
                $query->orWhere('clients.last_name', 'like', "%$search%");
                $query->orWhere('loans.id', 'like', "%$search%");
                $query->orWhere('loans.account_number', 'like', "%$search%");
                $query->orWhere('loans.external_id', 'like', "%$search%");
            })
            ->when($status, function ($query) use ($status) {
                $query->where("loans.status", $status);
            })
            ->when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
                $query->orderBy($orderBy, $orderByDir);
            })
            ->where("loans.client_id", session('client_id'))
            ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,concat(users.first_name,' ',users.last_name) loan_officer,loans.id,loans.client_id,loans.applied_amount,loans.principal,loans.disbursed_on_date,loans.expected_maturity_date,loan_products.name loan_product,loans.status,loans.decimals,branches.name branch, SUM(loan_repayment_schedules.principal) total_principal, SUM(loan_repayment_schedules.principal_written_off_derived) principal_written_off_derived, SUM(loan_repayment_schedules.principal_repaid_derived) principal_repaid_derived, SUM(loan_repayment_schedules.interest) total_interest, SUM(loan_repayment_schedules.interest_waived_derived) interest_waived_derived,SUM(loan_repayment_schedules.interest_written_off_derived) interest_written_off_derived,  SUM(loan_repayment_schedules.interest_repaid_derived) interest_repaid_derived,SUM(loan_repayment_schedules.fees) total_fees, SUM(loan_repayment_schedules.fees_waived_derived) fees_waived_derived, SUM(loan_repayment_schedules.fees_written_off_derived) fees_written_off_derived, SUM(loan_repayment_schedules.fees_repaid_derived) fees_repaid_derived,SUM(loan_repayment_schedules.penalties) total_penalties, SUM(loan_repayment_schedules.penalties_waived_derived) penalties_waived_derived, SUM(loan_repayment_schedules.penalties_written_off_derived) penalties_written_off_derived, SUM(loan_repayment_schedules.penalties_repaid_derived) penalties_repaid_derived")
            ->groupBy("loans.id")
            ->paginate($perPage)
            ->appends($request->input());
            //return response()->json(['msg' => 'Success', 'status' => '200','data' => $data]);
        return theme_view('portal::loan.index', compact('data'));
    }


     

    public function get_loans(Request $request)
    {

        $status = $request->status;
         $client_id =  $request->input('client_id');//input('');;
        $loan_officer_id = $request->loan_officer_id;
      

        $query = DB::table("loans")->leftJoin("clients", "clients.id", "loans.client_id")->leftJoin("loan_repayment_schedules", "loan_repayment_schedules.loan_id", "loans.id")->leftJoin("loan_products", "loan_products.id", "loans.loan_product_id")->leftJoin("branches", "branches.id", "loans.branch_id")->leftJoin("users", "users.id", "loans.loan_officer_id")->selectRaw("concat(clients.first_name,' ',clients.last_name) client,concat(users.first_name,' ',users.last_name) loan_officer,loans.id,loans.client_id,loans.principal,loans.disbursed_on_date,loans.expected_maturity_date,loan_products.name loan_product,loans.status,loans.decimals,branches.name branch, SUM(loan_repayment_schedules.principal) total_principal, SUM(loan_repayment_schedules.principal_written_off_derived) principal_written_off_derived, SUM(loan_repayment_schedules.principal_repaid_derived) principal_repaid_derived, SUM(loan_repayment_schedules.interest) total_interest, SUM(loan_repayment_schedules.interest_waived_derived) interest_waived_derived,SUM(loan_repayment_schedules.interest_written_off_derived) interest_written_off_derived,  SUM(loan_repayment_schedules.interest_repaid_derived) interest_repaid_derived,SUM(loan_repayment_schedules.fees) total_fees, SUM(loan_repayment_schedules.fees_waived_derived) fees_waived_derived, SUM(loan_repayment_schedules.fees_written_off_derived) fees_written_off_derived, SUM(loan_repayment_schedules.fees_repaid_derived) fees_repaid_derived,SUM(loan_repayment_schedules.penalties) total_penalties, SUM(loan_repayment_schedules.penalties_waived_derived) penalties_waived_derived, SUM(loan_repayment_schedules.penalties_written_off_derived) penalties_written_off_derived, SUM(loan_repayment_schedules.penalties_repaid_derived) penalties_repaid_derived")->when($status, function ($query) use ($status) {
            $query->where("loans.status", $status);
        })->when($client_id, function ($query) use ($client_id) {
            $query->where("loans.client_id", $client_id);
        })->when($loan_officer_id, function ($query) use ($loan_officer_id) {
            $query->where("loans.loan_officer_id", $loan_officer_id);
        })->groupBy("loans.id");
        return DataTables::of($query)->editColumn('client', function ($data) {
            return '<a href="' . url('portal/client/' . $data->client_id . '/show') . '">' . $data->client . '</a>';
        })->editColumn('principal', function ($data) {
            return number_format($data->principal, $data->decimals);
        })->editColumn('total_principal', function ($data) {
            return number_format($data->total_principal, $data->decimals);
        })->editColumn('total_interest', function ($data) {
            return number_format($data->total_interest, $data->decimals);
        })->editColumn('total_fees', function ($data) {
            return number_format($data->total_fees, $data->decimals);
        })->editColumn('total_penalties', function ($data) {
            return number_format($data->total_penalties, $data->decimals);
        })->editColumn('due', function ($data) {
            return number_format($data->total_principal + $data->total_interest + $data->total_fees + $data->total_penalties, $data->decimals);
        })->editColumn('balance', function ($data) {
            return number_format(($data->total_principal - $data->principal_repaid_derived - $data->principal_written_off_derived) + ($data->total_interest - $data->interest_repaid_derived - $data->interest_written_off_derived - $data->interest_waived_derived) + ($data->total_fees - $data->fees_repaid_derived - $data->fees_written_off_derived - $data->fees_waived_derived) + ($data->total_penalties - $data->penalties_repaid_derived - $data->penalties_written_off_derived - $data->penalties_waived_derived), $data->decimals);
        })->editColumn('status', function ($data) {
            if ($data->status == 'pending') {
                return '<span class="label label-warning">' . trans_choice('loan::general.pending', 1) . ' ' . trans_choice('general.approval', 1) . '</span>';
            }
            if ($data->status == 'submitted') {
                return '<span class="label label-warning">' . trans_choice('loan::general.pending_approval', 1) . '</span>';
            }
            if ($data->status == 'overpaid') {
                return '<span class="label label-warning">' . trans_choice('loan::general.overpaid', 1) . '</span>';
            }
            if ($data->status == 'approved') {
                return '<span class="label label-warning">' . trans_choice('loan::general.awaiting_disbursement', 1) . '</span>';
            }
            if ($data->status == 'active') {
                return '<span class="label label-info">' . trans_choice('loan::general.active', 1) . '</span>';
            }
            if ($data->status == 'rejected') {
                return '<span class="label label-danger">' . trans_choice('loan::general.rejected', 1) . '</span>';
            }
            if ($data->status == 'withdrawn') {
                return '<span class="label label-danger">' . trans_choice('loan::general.withdrawn', 1) . '</span>';
            }
            if ($data->status == 'written_off') {
                return '<span class="label label-danger">' . trans_choice('loan::general.written_off', 1) . '</span>';
            }
            if ($data->status == 'closed') {
                return '<span class="label label-success">' . trans_choice('loan::general.closed', 1) . '</span>';
            }
            if ($data->status == 'pending_reschedule') {
                return '<span class="label label-warning">' . trans_choice('loan::general.pending_reschedule', 1) . '</span>';
            }
            if ($data->status == 'rescheduled') {
                return '<span class="label label-info">' . trans_choice('loan::general.rescheduled', 1) . '</span>';
            }

        })->editColumn('action', function ($data) {

            $action = '<a href="' . url('portal/loan/' . $data->id . '/show') . '" class="btn btn-info">' . trans_choice('general.detail', 2) . '</a>';

            return $action;
        })->editColumn('id', function ($data) {
            return '<a href="' . url('portal/loan/' . $data->id . '/show') . '" class="">' . $data->id . '</a>';

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

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {

        $loan = Loan::with('repayment_schedules')->with('transactions')->with('charges')->with('client')->with('loan_product')->with('notes')->with('guarantors')->with('files')->with('collateral')->with('collateral.collateral_type')->with('notes.created_by')->find($id);
        if ($loan->client_id != session('client_id')) {
            Flash::warning(trans('core::general.permission_denied'));
            return redirect()->back();
        }
        return theme_view('portal::loan.show', compact('loan'));
    }

    //transactions
    public function show_transaction($id)
    {
        $loan_transaction = LoanTransaction::with('payment_detail')->with('loan')->find($id);
        return theme_view('portal::loan.loan_transaction.show', compact('loan_transaction'));
    }

    public function pdf_transaction($id)
    {
        $loan_transaction = LoanTransaction::with('payment_detail')->with('loan')->find($id);
        $pdf = PDF::loadView('portal::loan.loan_transaction.pdf', compact('loan_transaction'));
        return $pdf->download(trans_choice('loan::general.transaction', 1) . ' ' . trans_choice('loan::general.detail', 2) . ".pdf");
    }

    public function print_transaction($id)
    {
        $loan_transaction = LoanTransaction::with('payment_detail')->with('loan')->find($id);
        return theme_view('portal::loan.loan_transaction.print', compact('loan_transaction'));
    }

    //schedules
    public function email_schedule($id)
    {
        $loan = Loan::with('repayment_schedules')->find($id);
        //return theme_view('loan::loan_schedule.email', compact('loan'));
    }

    public function pdf_schedule($id)
    {
        $loan = Loan::with('repayment_schedules')->find($id);
        $pdf = PDF::loadView('portal::loan.loan_schedule.pdf', compact('loan'))->setPaper('a4', 'landscape');
        return $pdf->download(trans_choice('loan::general.repayment', 1) . ' ' . trans_choice('loan::general.schedule', 1) . ".pdf");
    }

    public function print_schedule($id)
    {
        $loan = Loan::with('repayment_schedules')->find($id);
        return theme_view('portal::loan.loan_schedule.print', compact('loan'));
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

    public function application(Request $request)
    {
        $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        $search = $request->s;
        $status = $request->status;
        $client_id = $request->client_id;
        $loan_officer_id = $request->loan_officer_id;
        $branch_id = $request->branch_id;
       // echo session('client_id'); 
       // echo $client_id;
       // echo $branch_id;

       //  exit();

        $data = LoanApplication::leftJoin("clients", "clients.id", "loan_applications.client_id")
            ->leftJoin("loan_products", "loan_products.id", "loan_applications.loan_product_id")
            ->leftJoin("branches", "branches.id", "loan_applications.branch_id")
            ->leftJoin("users", "users.id", "loan_applications.created_by_id")
            ->when($status, function ($query) use ($status) {
                $query->where("loan_applications.status", $status);
            })
            ->when($branch_id, function ($query) use ($branch_id) {
                $query->where("loan_applications.branch_id", $branch_id);
            })
            ->when($search, function (Builder $query) use ($search) {
                $query->where('loan_products.name', 'like', "%$search%");
                $query->orWhere('clients.first_name', 'like', "%$search%");
                $query->orWhere('clients.last_name', 'like', "%$search%");
                $query->orWhere('loan_applications.id', 'like', "%$search%");
            })
            ->when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
                $query->orderBy($orderBy, $orderByDir);
            })
            ->where('client_id', session('client_id'))
            ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,concat(users.first_name,' ',users.last_name) created_by,loan_applications.id,loan_applications.client_id,loan_products.name loan_product,loan_applications.status,loan_applications.loan_id,branches.name branch,loan_applications.amount,loan_applications.created_at")
            ->groupBy("loan_applications.id")
            ->paginate($perPage)
            ->appends($request->input());
            //return response()->json(['msg' => 'Success', 'status' => '200','data' => $data]);
            //print_r($data);exit;

       return theme_view('portal::loan.application.index', compact('data'));
    }

    public function my_application(Request $request)
    {
       $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        $search = $request->s;
        $status = $request->status;
      // echo $account_id = $request->query('client_id');
        //$id = $request->input('client_id');
        $client_id = $request->client_id;
        $loan_officer_id = $request->loan_officer_id;
        $branch_id = $request->branch_id;
       // echo session('client_id'); 
       // echo $client_id;
       //  echo $branch_id;

      

        $data = LoanApplication::leftJoin("clients", "clients.id", "loan_applications.client_id")
            ->leftJoin("loan_products", "loan_products.id", "loan_applications.loan_product_id")
            ->leftJoin("branches", "branches.id", "loan_applications.branch_id")
            ->leftJoin("users", "users.id", "loan_applications.created_by_id")
            ->when($status, function ($query) use ($status) {
                $query->where("loan_applications.status", $status);
            })
            ->when($branch_id, function ($query) use ($branch_id) {
                $query->where("loan_applications.branch_id", $branch_id);
            })
            ->when($search, function (Builder $query) use ($search) {
                $query->where('loan_products.name', 'like', "%$search%");
                $query->orWhere('clients.first_name', 'like', "%$search%");
                $query->orWhere('clients.last_name', 'like', "%$search%");
                $query->orWhere('loan_applications.id', 'like', "%$search%");
            })
            ->when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
                $query->orderBy($orderBy, $orderByDir);
            })
            ->where('client_id', $client_id)
            ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,concat(users.first_name,' ',users.last_name) created_by,loan_applications.id,loan_applications.client_id,loan_products.name loan_product,loan_applications.status,loan_applications.loan_id,branches.name branch,loan_applications.amount,loan_applications.created_at")
            ->groupBy("loan_applications.id")
            ->paginate($perPage)
           ->appends($request->input());
           // exit();
            return response()->json(['msg' => 'Success', 'status' => '200','data' => $data]);
            //print_r($data);exit;

       // return theme_view('portal::loan.application.index', compact('data'));
    }

    public function create_application()
    {
        $loan_products = LoanProduct::where('active', 1)->get();
        \JavaScript::put([
            'loan_products' => $loan_products
        ]);
        return theme_view('portal::loan.application.create', compact('loan_products'));
    }

    public function store_application(Request $request)
    {
        $client = Client::find(session('client_id'));
        if (empty($client)) {
            Flash::warning(trans('loan::general.client_not_found_please_logout'));
            return redirect()->back();
        }
        $request->validate([
            'loan_product_id' => ['required'],
            'amount' => ['required', 'numeric'],
        ]);
        $loan_application = new LoanApplication();
        $loan_application->client_id = $client->id;
        $loan_application->created_by_id = Auth::id();
        $loan_application->branch_id = $client->branch_id;
        $loan_application->loan_product_id = $request->loan_product_id;
        $loan_application->amount = $request->amount;
        $loan_application->notes = $request->notes;
        $loan_application->save();
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('portal/loan/application');
        //return response()->json(['msg' => 'Success', 'status' => '200','data' => $data]);
    }

public function getPending($id)
          {
            $info = DB::select("SELECT * FROM loan_applications WHERE client_id =".$id." AND status ='pending' ");
            //print_r($info);exit;
            return $info;
       
         }
public function loan_products()
          {
            $info = DB::select("SELECT * FROM loan_products WHERE  active ='1' ");
            //print_r($info);exit;
            return response()->json(['msg' => 'Success', 'status' =>200,'data'=>$info]);
       
         }

public function borrow_loan(Request $request)
    {

        $id = $request->client_id;
        $amount = $request->amount;
        $loan_product = $request->loan_product_id;

        if (!$id || !$amount || !$loan_product) {
            //if (!$id || !$amount || !$loan_product) {
           return response()->json(['msg' => 'All fields are required please check and try again..', 'status' =>400]);
             
        }


        if($this->getPending($id)){
            return response()->json(['msg' => 'You have a pending loan application,please be patient as we finalise processing your loan...', 'status' =>400]);
        }

        $client = Client::find($id);
       // print_r($client);
        if (empty($client)) {
           return response()->json(['msg' => 'No records found Please contact us for more details.', 'status' =>400]);
             
        }
        // $request->validate([
        //     'loan_product_id' => ['required'],
        //     'amount' => ['required', 'numeric'],
        // ]);
        $loan_application = new LoanApplication();
        $loan_application->client_id = $client->id;
        $loan_application->created_by_id =0; //Auth::id();
        $loan_application->branch_id = $client->branch_id;
        $loan_application->loan_product_id = $request->loan_product_id;
        $loan_application->amount = $request->amount;
        $loan_application->notes = $request->notes;
        $loan_application->save();
        // \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        // return redirect('portal/loan/application');
        return response()->json(['msg' => 'Loan application successful, You will be notified when the loan is processed.Thank you ,', 'status' => 200,'data' =>'']);
    }

    public function destroy_application(Request $request, $id)
    {
        $client = Client::find(session('client_id'));
        $loan_application = LoanApplication::find($id);
        if (empty($client)) {
            Flash::warning(trans('loan::general.client_not_found_please_logout'));
            return redirect()->back();
        }
        if ($loan_application->client_id != session('client_id')) {
            Flash::warning(trans('core::general.permission_denied'));
            return redirect()->back();
        }
        if ($loan_application->status != 'pending') {
            Flash::warning(trans('core::general.permission_denied'));
            return redirect()->back();
        }
        $loan_application->delete();
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect('portal/loan/application');
    }

//repayments
    public function create_repayment($id)
    {
        $payment_types = PaymentType::where('is_online',1)->where('active',1)->get();
        $custom_fields = CustomField::where('category', 'add_repayment')->where('active', 1)->get();
        return theme_view('portal::loan.loan_repayment.create', compact('id', 'custom_fields', 'payment_types'));
    }

    public function store_repayment(Request $request, $id)
    {
        $loan = Loan::with('loan_product')->find($id);
        $client = Client::find($request->client_id);
        if (empty($client)) {
            Flash::warning(trans('loan::general.client_not_found_please_logout'));
            return redirect()->back();
        }
        if ($loan->client_id != $request->client_id) {
            Flash::warning(trans('core::general.permission_denied'));
            return redirect()->back();
        }
        $request->validate([
            'amount' => ['required', 'numeric'],
            'payment_gateway' => ['required'],
        ]);

        $class = 'Modules\\' . $request->payment_gateway . '\\' . $request->payment_gateway;
        $class = new $class;
        $response = $class->processPayment([
            'id' => $id,
            'amount' => $request->amount,
            'module' => 'loan',
            'return_url' => url('portal/loan/' . $id . '/show')
        ]);
        if($response instanceof Response){
            return $response;
        }
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('portal/loan/' . $id . '/show');
    }

    public function arreas(Request $request){



       $date=date_create(date("Y-m-d"));
        date_sub($date,date_interval_create_from_date_string("30 days"));
        // echo date_format($date,"Y-m-d");
       
        $start_date = date_format($date,"Y-m-d");
        $end_date = date("Y-m-d");
        $branch_id = $request->branch_id;
        $data = [];
        $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        //$branches = Branch::all();
        $loan_product_id = $request->loan_product_id;
        $loan_officer_id = $request->loan_officer_id;
        // $users = User::whereHas('roles', function ($query) {
        //     return $query->where('name', '!=', 'client');
        // })->get();
        $users = User::when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
            $query->orderBy($orderBy, $orderByDir);
        })->get();

       // $this->sendEmail($branch_id,$email,$loan_officer_id)
        foreach ($users as $value) {

           // echo '<pre>';print_r($value);
            if($value->branch_id){
            //      echo $value->branch_id;

             $names =$value->first_name.'-'.$value->last_name;

            $this->sendEmail($value->branch_id,$value->email,$value->id,$names);
             }
         }


      // echo '<pre>'; print_r($users);

       exit;
       

        $r =[];
        $branches =Branch::all();
        $loan_products = LoanProduct::all();

        if (!empty($end_date)) {

            //loan_repayment_schedules where <'$end_date'
            //(loan_repayment_schedules.due_date BETWEEN '$start_date' AND '$end_date') AND 
            $data = Loan::with("repayment_schedules")
                ->join(DB::raw("(select*from loan_repayment_schedules where (loan_repayment_schedules.due_date BETWEEN '$start_date' AND '$end_date') AND  total_due>0) loan_repayment_schedules"), "loan_repayment_schedules.loan_id", "loans.id")
                ->join("branches", "loans.branch_id", "branches.id")
                ->join("loan_products", "loans.loan_product_id", "loan_products.id")
                ->join("clients", "loans.client_id", "clients.id")
                ->leftJoin("users", "loans.loan_officer_id", "users.id")
                ->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('loans.branch_id', $branch_id);
                })

                //->whereBetween('date_created', [$start_date, $end_date])

                ->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('loans.loan_officer_id', $loan_officer_id);
                })
                ->when($loan_product_id, function ($query) use ($loan_product_id) {
                    $query->where('loans.loan_product_id', $loan_product_id);
                })
                ->where('loans.status', 'active')
                ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,clients.mobile,concat(users.first_name,' ',users.last_name) loan_officer,branches.name branch,clients.mobile,loans.client_id,loan_products.name loan_product,loans.expected_maturity_date,loans.disbursed_on_date,loans.id,(SELECT submitted_on FROM loan_transactions WHERE loan_id=loans.id ORDER BY submitted_on DESC LIMIT 1) last_payment_date,loans.principal")
                ->groupBy('loans.id')
                ->get();
            //check if we should download
            //       if ($request->download) {
            
            //     if ($request->type == 'pdf') {
            //         $pdf = PDF::loadView(theme_view_file('loan::report.arrears_pdf'), compact('start_date',
            //             'end_date', 'branch_id', 'data', 'branches'))->setPaper('A4', 'landscape');
            //         return $pdf->download(trans_choice('loan::general.arrears', 1) . '( as at ' . $end_date . ').pdf');
            //     }
            //     $view = theme_view('loan::report.arrears_pdf',
            //         compact('start_date',
            //     'end_date', 'branch_id', 'data', 'branches','users','loan_products','loan_officer_id','loan_product_id'));
            //     if ($request->type == 'excel_2007') {
            //         return Excel::download(new LoanExport($view), trans_choice('loan::general.arrears', 1) . '(as at ' . $end_date . ').xlsx');
            //     }
            //     if ($request->type == 'excel') {
            //         return Excel::download(new LoanExport($view), trans_choice('loan::general.arrears', 1) . '(as at ' . $end_date . ').xls');
            //     }
            //     if ($request->type == 'csv') {
            //         return Excel::download(new LoanExport($view), trans_choice('loan::general.arrears', 1) . '(as at' . $end_date . ').csv');
            //     }
            // }


            $pdf = PDF::loadView(theme_view_file('loan::report.arrears_pdf'), compact('start_date',
                        'end_date', 'branch_id', 'data', 'branches'))->setPaper('A4', 'landscape');
            //$pdf->download(trans_choice('loan::general.arrears', 1) . '( as at ' . $end_date . ').pdf');
            // $pdf ='';


        $data2["email"] = "ronokenn42@gmail.com";
        $data2["title"] = "Arreas - Collection Report";
        $data2["body"] = "Please find the attached arreas reports for the week";



        Mail::send([],[], function($message)use($data2,$pdf) {
            $message->to($data2["email"])
            ->from('noreply@josamgroup.com','JOSAMGROUP')
            ->subject($data2["title"])->setBody($data2["body"])->attachData($pdf->output(),'Arreas-report.pdf');
           // ->setBody(theme_view_file('loan::report.arrears_pdf'), compact('start_date', 'end_date', 'branch_id', 'data', 'branches'), 'text/html'); // for HTML rich messages
 
            //foreach ($files as $file){
            //$message->attach($pdf);
            //}            
        });

        }


         
           // echo "<pre>";


        // echo count($data);

        //print_r($data);

        exit;
        

    

         $data["email"] = "toobethwel@gmail.com";
        $data["title"] = "Arreas - Collection Report";
        $data["body"] = "Please find the attached arreas reports for the week";
 
  
        Mail::send([], [], function($message)use($data, $pdf) {
            $message->to($data["email"])
            ->from('noreply@josamgroup.com','JOSAMGROUP')
            ->subject($data["title"])
            ->setBody('<h1>Hi, welcome user!</h1>', 'text/html'); // for HTML rich messages
 
            //foreach ($files as $file){
            //$message->attach($pdf);
            //}            
        });


    
   }

   function sendEmail($branch_id,$email,$loan_officer_id,$names){



   // echo $branch_id;echo $email;
   //  exit;

        $date=date_create(date("Y-m-d"));
        date_sub($date,date_interval_create_from_date_string("600 days"));
        $branch_info = DB::table('branches')->where('id', $branch_id)->first();
        // echo date_format($date,"Y-m-d");
       
        $start_date = date_format($date,"Y-m-d");
        $end_date = date("Y-m-d");
        $branch_id = $branch_id;
        $data = [];
        $perPage =  50;
        $orderBy = '';
        $orderByDir = '';


        //$branches = Branch::all();
        $loan_product_id ='' ;
        $loan_officer_id = $loan_officer_id;
    
        $users = [];
        $r =[];
        $branches =[];//Branch::all();
        $loan_products =[]; //LoanProduct::all();
      
        if (!empty($end_date)) {

            //loan_repayment_schedules where <'$end_date'
            //(loan_repayment_schedules.due_date BETWEEN '$start_date' AND '$end_date') AND 
            $data = Loan::with("repayment_schedules")
                ->join(DB::raw("(select*from loan_repayment_schedules where (loan_repayment_schedules.due_date BETWEEN '$start_date' AND '$end_date') AND  total_due>0) loan_repayment_schedules"), "loan_repayment_schedules.loan_id", "loans.id")
                ->join("branches", "loans.branch_id", "branches.id")
                ->join("loan_products", "loans.loan_product_id", "loan_products.id")
                ->join("clients", "loans.client_id", "clients.id")
                ->leftJoin("users", "loans.loan_officer_id", "users.id")
                ->when($branch_id, function ($query) use ($branch_id) {
                    $query->where('loans.branch_id', $branch_id);
                })

                //->whereBetween('date_created', [$start_date, $end_date])

                ->when($loan_officer_id, function ($query) use ($loan_officer_id) {
                    $query->where('loans.loan_officer_id', $loan_officer_id);
                })
                // ->when($loan_product_id, function ($query) use ($loan_product_id) {
                //     $query->where('loans.loan_product_id', $loan_product_id);
                // })
                ->where('loans.status', 'active')
                ->selectRaw("concat(clients.first_name,' ',clients.last_name) client,clients.mobile,concat(users.first_name,' ',users.last_name) loan_officer,branches.name branch,clients.mobile,loans.client_id,loan_products.name loan_product,loans.expected_maturity_date,loans.disbursed_on_date,loans.id,(SELECT submitted_on FROM loan_transactions WHERE loan_id=loans.id ORDER BY submitted_on DESC LIMIT 1) last_payment_date,loans.principal")
                ->groupBy('loans.id')
                ->get();
            //check if we should download
            //       if ($request->download) {
            
            //     if ($request->type == 'pdf') {
            //         $pdf = PDF::loadView(theme_view_file('loan::report.arrears_pdf'), compact('start_date',
            //             'end_date', 'branch_id', 'data', 'branches'))->setPaper('A4', 'landscape');
            //         return $pdf->download(trans_choice('loan::general.arrears', 1) . '( as at ' . $end_date . ').pdf');
            //     }
            //     $view = theme_view('loan::report.arrears_pdf',
            //         compact('start_date',
            //     'end_date', 'branch_id', 'data', 'branches','users','loan_products','loan_officer_id','loan_product_id'));
            //     if ($request->type == 'excel_2007') {
            //         return Excel::download(new LoanExport($view), trans_choice('loan::general.arrears', 1) . '(as at ' . $end_date . ').xlsx');
            //     }
            //     if ($request->type == 'excel') {
            //         return Excel::download(new LoanExport($view), trans_choice('loan::general.arrears', 1) . '(as at ' . $end_date . ').xls');
            //     }
            //     if ($request->type == 'csv') {
            //         return Excel::download(new LoanExport($view), trans_choice('loan::general.arrears', 1) . '(as at' . $end_date . ').csv');
            //     }
            // }


        $pdf = PDF::loadView(theme_view_file('loan::report.arrears_pdf'), compact('start_date',
                        'end_date', 'branch_id', 'data', 'branches'))->setPaper('A4', 'landscape');
        echo count($data); echo $email; echo '<br>';
       if(count($data) > 0){
        $data2["email"] = $email;
        $data2["title"] = "Arreas - Collection Report";
        $data2["body"] = "Please find the attached arreas reports for the week";
        $data2["branch"] = $branch_info->name;
 
        Mail::send([],[], function($message)use($data2,$pdf,$names) {
            $message->to($data2["email"])
            ->from('noreply@josamgroup.com','JOSAMGROUP')
            //->body($data2["body"])

            ->subject($data2["title"])->attachData($pdf->output(), strtoupper($names.' '.$data2["branch"]).' ARREAS AS AT '.date("Y-m-d H:i:s").'.pdf');
           // ->setBody(theme_view_file('loan::report.arrears_pdf'), compact('start_date', 'end_date', 'branch_id', 'data', 'branches'), 'text/html'); // for HTML rich messages
 
            //foreach ($files as $file){
            //$message->attach($pdf);
            //}            
        });

        }
    }


   }
   public function html_email() {
      $data = array('name'=>"Virat Gandhi");
      Mail::send('mail', $data, function($message) {
         $message->to('abc@gmail.com', 'Tutorials Point')->subject
            ('Laravel HTML Testing Mail');
         $message->from('xyz@gmail.com','Virat Gandhi');
      });
      echo "HTML Email Sent. Check your inbox.";

    }



}
