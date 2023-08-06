<?php

namespace Modules\Client\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Laracasts\Flash\Flash;
use Modules\Branch\Entities\Branch;
use Modules\Client\Entities\Client;
use Modules\Client\Entities\ClientType;
use Modules\Client\Entities\ClientUser;
use Modules\Client\Entities\Profession;
use Modules\Client\Entities\Title;
use Modules\Core\Entities\Country;
use Modules\CustomField\Entities\CustomField;
use Modules\User\Entities\User;
use Spatie\Permission\Models\Role;
use Yajra\DataTables\Facades\DataTables;
use Modules\Loan\Entities\LoanWallets;
use Modules\Loan\Entities\LoanLimits;
use AfricasTalking\SDK\AfricasTalking;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Reader\Exception;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ClientController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:client.clients.index'])->only(['index', 'show', 'get_clients']);
        $this->middleware(['permission:client.clients.create'])->only(['create', 'store']);
        $this->middleware(['permission:client.clients.edit'])->only(['edit', 'update']);
        $this->middleware(['permission:client.clients.destroy'])->only(['destroy']);
        $this->middleware(['permission:client.clients.user.create'])->only(['store_user', 'create_user']);
        $this->middleware(['permission:client.clients.user.destroy'])->only(['destroy_user']);
        $this->middleware(['permission:client.clients.activate'])->only(['change_status']);

    }


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
     * Display a listing of the resource.
     * @return Response
     */

    public function index(Request $request)
    {   

        $bid =Auth::user()->orgid;
        $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        $search = $request->s;
        $status = $request->status;
        $data = Client::leftJoin("branches", "branches.id", "clients.branch_id")
            ->leftJoin("users", "users.id", "clients.loan_officer_id")
            ->when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
                $query->orderBy($orderBy, $orderByDir);
            })

             ->when($bid, function (Builder $query) use ($bid) {
                $roles  =Auth::user()->roles()->get();
                 $r =[];
                  foreach ($roles as $key) {

                    if($key->id == 4 ){
                        array_push($r, $key->id);
                    }
                  }
             if(count($r) === 0 ){
                $query->where('clients.orgid', $bid);
               }
                
            })
            ->when($search, function (Builder $query) use ($search) {
                $query->where('clients.first_name', 'like', "%$search%");
                $query->orWhere('clients.last_name', 'like', "%$search%");
                $query->orWhere('clients.account_number', 'like', "%$search%");
                $query->orWhere('clients.mobile', 'like', "%$search%");
                $query->orWhere('clients.external_id', 'like', "%$search%");
                $query->orWhere('clients.email', 'like', "%$search%");
            })
            ->when($status, function ($query) use ($status) {
                $query->where('clients.status', $status);
            })
            ->selectRaw("branches.name branch,concat(users.first_name,' ',users.last_name) staff,clients.id,clients.loan_officer_id,clients.first_name,clients.last_name,clients.gender,clients.mobile,clients.email,clients.external_id,clients.status")
            ->paginate($perPage)
            ->appends($request->input());
        return theme_view('client::client.index', compact('data'));
    }

    public function get_clients(Request $request)
    {

        $status = $request->status;
        $bid =Auth::user()->orgid;
        $query = DB::table("clients")
            ->leftJoin("branches", "branches.id", "clients.branch_id")
            ->leftJoin("users", "users.id", "clients.loan_officer_id")
            ->selectRaw("branches.name branch,concat(users.first_name,' ',users.last_name) staff,clients.id,clients.loan_officer_id,concat(clients.first_name,' ',clients.last_name) name,clients.gender,clients.mobile,clients.email,clients.external_id,clients.status")
            ->when($bid, function (Builder $query) use ($bid) {
                $roles  =Auth::user()->roles()->get();
                 $r =[];
                  foreach ($roles as $key) {
                    if($key->id == 4 ){
                       array_push($r, $key->id);
                    }
                  }
            if(count($r) === 0 ){
                $query->where('clients.orgid', $bid);
                }
                
            })
            ->when($status, function ($query) use ($status) {
                $query->where('status', $status);
            });
        return DataTables::of($query)->editColumn('staff', function ($data) {
            return $data->staff;
        })->editColumn('action', function ($data) {
            $action = '<div class="btn-group"><button type="button" class="btn btn-info btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-navicon"></i></button> <ul class="dropdown-menu dropdown-menu-right" role="menu">';
            $action .= '<li><a href="' . url('client/' . $data->id . '/show') . '" class="">' . trans_choice('user::general.detail', 2) . '</a></li>';
            if (Auth::user()->hasPermissionTo('client.clients.edit')) {
                $action .= '<li><a href="' . url('client/' . $data->id . '/edit') . '" class="">' . trans_choice('user::general.edit', 2) . '</a></li>';
            }
            if (Auth::user()->hasPermissionTo('client.clients.destroy')) {
                $action .= '<li><a href="' . url('client/' . $data->id . '/destroy') . '" class="confirm">' . trans_choice('user::general.delete', 2) . '</a></li>';
            }
            $action .= "</ul></li></div>";
            return $action;
        })->editColumn('id', function ($data) {
            return '<a href="' . url('client/' . $data->id . '/show') . '">' . $data->id . '</a>';

        })->editColumn('name', function ($data) {
            return '<a href="' . url('client/' . $data->id . '/show') . '">' . $data->name . '</a>';

        })->editColumn('gender', function ($data) {
            if ($data->gender == "male") {
                return trans_choice('core::general.male', 1);
            }
            if ($data->gender == "female") {
                return trans_choice('core::general.female', 1);
            }
            if ($data->gender == "other") {
                return trans_choice('core::general.other', 1);
            }
            if ($data->gender == "unspecified") {
                return trans_choice('core::general.unspecified', 1);
            }
        })->editColumn('status', function ($data) {
            if ($data->status == "pending") {
                return trans_choice('core::general.pending', 1);
            }
            if ($data->status == "active") {
                return trans_choice('core::general.active', 1);
            }
            if ($data->status == "inactive") {
                return trans_choice('core::general.inactive', 1);
            }
            if ($data->gender == "deceased") {
                return trans_choice('client::general.deceased', 1);
            }
            if ($data->gender == "unspecified") {
                return trans_choice('core::general.unspecified', 1);
            }
        })->rawColumns(['id', 'name', 'action'])->make(true);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        $titles = Title::all();
        $professions = Profession::all();
        $client_types = ClientType::all();
        $users = User::whereHas('roles', function ($query) {
            return $query->where('name', '!=', 'client');
        })->get();
        $bid =Auth::user()->orgid;
        $roles  =Auth::user()->roles()->get();
        $r =[];
        foreach ($roles as $key) {
                    if($key->id == 4 ){
                        array_push($r, $key->id);
                    }
                  }
        if(count($r) === 0 ){
         $branches =  DB::table('branches')->where('orgid', $bid)->get(); //Branch::all();
                }else{
          $branches =Branch::all();
         }
        //$branches = Branch::all();
        $countries = Country::all();
        $custom_fields = CustomField::where('category', 'add_client')->where('active', 1)->get();
        return theme_view('client::client.create', compact('titles', 'professions', 'client_types', 'users', 'branches', 'countries', 'custom_fields'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'first_name' => ['required'],
            'last_name' => ['required'],
            'idnumber' => ['required'],
            'mobile' => ['required'],
            'gender' => ['required'],
            'branch_id' => ['required'],
            'email' => ['nullable','email', 'max:255'],
            'dob' => ['required', 'date'],
            'created_date' => ['required', 'date'],
            'photo' => ['nullable', 'image', 'mimes:jpg,jpeg,png'],
        ]);

          // check account validations
        if($request->email!=''){
           $Emailexists = Client::where('email', '=', $request->email)->first();
           if ($Emailexists) {
           	 \flash(trans_choice("Account  with Email entered exists", 1))->error()->important();
           	 return redirect()->back()->withInput();
			} 
        }
		   $Phoneexists = Client::where('mobile', '=', "254".(int)$request->mobile)->first();
           if ($Phoneexists) {
           	 \flash(trans_choice("Account  with mobile entered exists", 1))->error()->important();
           	 return redirect()->back()->withInput();
			} 
			 $idnumber = Client::where('idnumber', '=', $request->idnumber)->first();
           if ($idnumber) {
           	 \flash(trans_choice("Account  with ID number entered exists", 1))->error()->important();
           	 return redirect()->back()->withInput();
			} 

			// End of validations
          
        $client = new Client();
        $client->first_name = $request->first_name;
        $client->last_name = $request->last_name;
        $client->external_id = $request->external_id;
        $client->created_by_id = Auth::id();
        $client->gender = $request->gender;
        $client->country_id = $request->country_id;
        $client->loan_officer_id = $request->loan_officer_id;
        $client->title_id = $request->title_id;
        $client->branch_id = $request->branch_id;
        $client->client_type_id = $request->client_type_id;
        $client->profession_id = $request->profession_id;
        $client->mobile = "254".(int)$request->mobile;
        $client->phone = "254".(int)$request->mobile;
        $client->account_number = "254".(int)$request->mobile;
        $client->idnumber = $request->idnumber;
        $client->password = Hash::make($request->idnumber);
        $client->notes = $request->notes;
        $client->email = $request->email;
        $client->address = $request->address;
        $client->marital_status = $request->marital_status;
        $client->created_date = $request->created_date;
        $client->orgid = Auth::user()->orgid;
        $request->dob ? $client->dob = $request->dob : '';
        if ($request->hasFile('photo')) {
            $file_name = $request->file('photo')->store('public/uploads/clients');
            $client->photo = basename($file_name);
        }

        $client->save();
      $last = Client::orderBy('created_at', 'desc')->first();
      //print_r($last);exit;
      if($last){
          date_default_timezone_set("Africa/Nairobi");
                $current =0;
                $wallet = new LoanWallets();
                $wallet->CustomerID = $last->id;
                $wallet->balance =  $current;
                $wallet->AccountID = "254".(int)$request->mobile;;
                $wallet->created_on = date("Y-m-d h:i:s");
                $wallet->updated_at = date("Y-m-d h:i:s");
                $wallet->orgid = Auth::user()->orgid;
                $wallet->save();

                  //Limits 
                //$current =0;
                $limits = new LoanLimits();
                $limits->customer_id = $last->id;
                $limits->limit_amount =  1000;
                $limits->status =  1;
                $limits->phone = "254".(int)$request->mobile;;
                $limits->id_number = $request->idnumber;
                $limits->orgid = Auth::user()->orgid;
                $limits->save();
            }

        $msg ="Dear ".$client->first_name." ".$client->last_name." Welcome to JOSAM SACCO.Your account has been created. Please note your account is 254".(int)$request->mobile." to enjoy our services.\r\nJOSAM SACCO,empowering all.";
         $this->sendSms($client->mobile,$msg);
       
        custom_fields_save_form('add_client', $request, $client->id);
        activity()->on($client)
            ->withProperties(['id' => $client->id])
            ->log('Create Client');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('client');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        $client = Client::with('loan_officer')->find($id);
        $custom_fields = CustomField::where('category', 'add_client')->where('active', 1)->get();
        return theme_view('client::client.show', compact('client', 'custom_fields'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $client = Client::find($id);
        $titles = Title::all();
        $professions = Profession::all();
        $client_types = ClientType::all();
        $users = User::whereHas('roles', function ($query) {
            return $query->where('name', '!=', 'client');
        })->get();
        //$branches = Branch::all();
        $roles  =Auth::user()->roles()->get();
                 $r =[];
                  foreach ($roles as $key) {
                    if($key->id == 4 ){
                        array_push($r, $key->id);
                    }
                  }
        if(count($r) === 0 ){
         $branches =  DB::table('branches')->where('orgid', $bid)->get(); //Branch::all();
                }else{
          $branches =Branch::all();
         }
        $countries = Country::all();
        $custom_fields = CustomField::where('category', 'add_client')->where('active', 1)->get();
        return theme_view('client::client.edit', compact('client', 'titles', 'professions', 'client_types', 'users', 'branches', 'countries', 'custom_fields'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'first_name' => ['required'],
            'last_name' => ['required'],
            'gender' => ['required'],
            'email' => ['nullable','email', 'max:255'],
            'dob' => ['required', 'date'],
            'photo' => ['nullable', 'image', 'mimes:jpg,jpeg,png'],
        ]);
     
        $client = Client::find($id);
        $client->first_name = $request->first_name;
        $client->last_name = $request->last_name;
        $client->external_id = $request->external_id;
        $client->branch_id = $request->branch_id;
        $client->gender = $request->gender;
        $client->country_id = $request->country_id;
        $client->loan_officer_id = $request->loan_officer_id;
        $client->title_id = $request->title_id;
        $client->client_type_id = $request->client_type_id;
        $client->profession_id = $request->profession_id;
        $client->mobile = $request->mobile;
        $client->notes = $request->notes;
        $client->email = $request->email;
        $client->address = $request->address;
        $client->marital_status = $request->marital_status;
        $client->orgid = Auth::user()->orgid;
        $request->dob ? $client->dob = $request->dob : '';
        if ($request->hasFile('photo')) {
            $file_name = $request->file('photo')->store('public/uploads/clients');
            //check if we had a file before
            if ($client->photo) {
                Storage::delete('public/uploads/clients/' . $client->photo);
            }
            $client->photo = basename($file_name);
        }
        $client->save();
        custom_fields_save_form('add_client', $request, $client->id);
        activity()->on($client)
            ->withProperties(['id' => $client->id])
            ->log('Update Client');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('client');
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        $client = Client::find($id);
        $client->delete();
        activity()->on($client)
            ->withProperties(['id' => $client->id])
            ->log('Delete Client');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }

    public function create_user($id)
    {
        $users = User::role('client')->get();
        $client = Client::find($id);
        return theme_view('client::client.create_user', compact('users', 'client'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store_user(Request $request, $id)
    {
        if ($request->existing == 1) {
            $request->validate([
                'user_id' => ['required'],
            ]);
            if (ClientUser::where('client_id', $id)->where('user_id', $request->user_id)->get()->count() > 0) {
                \flash(trans_choice("client::general.user_already_added", 1))->error()->important();
                return redirect()->back();
            }
            $client_user = new ClientUser();
            $client_user->client_id = $id;
            $client_user->created_by_id = Auth::id();
            $client_user->user_id = $request->user_id;
            $client_user->save();
        } else {
            $request->validate([
                'first_name' => ['required'],
                'last_name' => ['required'],
                'gender' => ['required'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'string', 'min:6', 'confirmed'],
            ]);
            $user = User::create([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'gender' => $request->gender,
                'phone' => $request->phone,
                'email' => $request->email,
                'notes' => $request->notes,
                'address' => $request->address,
                'password' => Hash::make($request->password),
                'email_verified_at' => date("Y-m-d H:i:s")
            ]);
            //attach client role
            $role = Role::findByName('client');
            $user->assignRole($role);
            $client_user = new ClientUser();
            $client_user->client_id = $id;
            $client_user->created_by_id = Auth::id();
            $client_user->user_id = $user->id;
            $client_user->save();
        }
        activity()->log('Create Client User');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('client/' . $id . '/show');
    }

    public function destroy_user($id)
    {
        ClientUser::destroy($id);
        activity()->log('Delete Client User');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }

    public function change_status(Request $request, $id)
    {
        $request->validate([
            'status' => ['required'],
            'date' => ['required', 'date'],
        ]);
        $client = Client::find($id);
        $client->status = $request->status;
        $client->save();
        activity()->on($client)
            ->withProperties(['id' => $client->id])
            ->log('Update Client Status');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect()->back();
    }

}
