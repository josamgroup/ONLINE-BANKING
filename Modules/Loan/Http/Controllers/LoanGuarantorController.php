<?php
namespace Modules\Loan\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Laracasts\Flash\Flash;
use Modules\Client\Entities\Client;
use Modules\Client\Entities\ClientRelationship;
use Modules\Client\Entities\ClientType;
use Modules\Client\Entities\Profession;
use Modules\Client\Entities\Title;
use Modules\Core\Entities\Country;
use Modules\Loan\Entities\LoanGuarantor;
use Modules\Loan\Entities\Loan;
use Illuminate\Support\Facades\DB;
use AfricasTalking\SDK\AfricasTalking;

class LoanGuarantorController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:loan.loans.guarantors.index'])->only(['index','show']);
        $this->middleware(['permission:loan.loans.guarantors.create'])->only(['create','store']);
        $this->middleware(['permission:loan.loans.guarantors.edit'])->only(['edit','update']);
        $this->middleware(['permission:loan.loans.guarantors.destroy'])->only(['destroy']);

    }

    /**
     * Display a listing of the resource.
     * @return Response
     */

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

    public function index()
    {
        return theme_view('loan::guarantor.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create($id)
    {
        $titles = Title::all();
        $professions = Profession::all();
        $client_types = ClientType::all();
        $client_relationships = ClientRelationship::all();
        $loan = Loan::find($id);
        $clients = Client::where(['status'=> 'active'])->get();
    
        $countries = Country::all();
        return theme_view('loan::guarantor.create', compact('id', 'titles', 'professions', 'client_types', 'clients', 'countries', 'client_relationships'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */


    public function getLimits($phone)
          {
            $limit = DB::select("SELECT * FROM loan_limits WHERE phone =".$phone." ");
            if($limit){
            return $limit[0]->limit_amount;

            }else{
                return 0;
             }
        }
    public function store(Request $request, $id)
    {
        $request->validate([
            'first_name' => ['required_if:is_client,0'],
            'last_name' => ['required_if:is_client,0'],
            'gender' => ['required_if:is_client,0'],
            'email' => ['nullable','string', 'email', 'max:255'],
            'dob' => ['required_if:is_client,0', 'date'],
            'client_relationship_id' => ['required_if:is_client,0'],
            'photo' => ['nullable','image', 'mimes:jpg,jpeg,png'],
        ]);
        $client = Client::find($request->client_id);

        $loan = Loan::find($id);
        $client2 = Client::find($loan->client_id);

        if((int)$loan->client_id == (int)$client->id ){
              
        \flash(trans_choice("You cannot guarantee yourself a loan.   ", 1))->error()->important();
         return redirect()->back();
               }


            $ls = DB::select('SELECT * FROM loans  WHERE client_id = '.$request->client_id.' AND (status ="submitted" OR status ="active" OR status ="rescheduled" OR status ="pending" OR status ="written_off" )  ');

        

                    if($ls){
                
                        \flash(trans_choice("Guarantor has one or more loans pending or active or loan being processed ", 1))->error()->important();
                                return redirect()->back();
                        
                    }


        $q = DB::select("SELECT SUM(guaranteed_amount) as amount FROM loan_guarantors  WHERE client_id = ".$request->client_id." AND (status ='pending') GROUP BY client_id ");
        if($q){
            //print_r($q);

            $bal =(int)$this->getLimits($client->mobile)-(int)$request->guaranteed_amount;
            $bal2 =(int)$this->getLimits($client->mobile)-((int)$q[0]->amount+(int)$request->guaranteed_amount);



            if($bal2 == 0){
                \flash(trans_choice("You cannot guarantee the loan. You have KES ".$bal2." to guarantee.   ", 1))->error()->important();
                return redirect()->back();
            }

            if($bal2 < 0){
                \flash(trans_choice("You cannot guarantee the loan. the quarannteed amount is more that available limit of KES ".$bal2.".   ", 1))->error()->important();
                return redirect()->back();
            }
           

        }

        $otp = random_int(100000, 999999);
        $loan_guarantor = new LoanGuarantor();
        $loan_guarantor->created_by_id = Auth::id();
        $loan_guarantor->loan_id = $id;
        $loan_guarantor->client_id = $request->client_id;
        $loan_guarantor->client_id = $request->client_id;
        $loan_guarantor->orgid = Auth::user()->orgid;
        $loan_guarantor->client_relationship_id = $request->client_relationship_id;
        (!empty($client)) ? $loan_guarantor->first_name = $client->first_name : $loan_guarantor->first_name = $request->first_name;
        (!empty($client)) ? $loan_guarantor->last_name = $client->last_name : $loan_guarantor->last_name = $request->last_name;
        (!empty($client)) ? $loan_guarantor->gender = $client->gender : $loan_guarantor->gender = $request->gender;
        (!empty($client)) ? $loan_guarantor->country_id = $client->country_id : $loan_guarantor->country_id = $request->country_id;
        (!empty($client)) ? $loan_guarantor->title_id = $client->title_id : $loan_guarantor->title_id = $request->title_id;
        (!empty($client)) ? $loan_guarantor->profession_id = $client->profession_id : $loan_guarantor->profession_id = $request->profession_id;
        (!empty($client)) ? $loan_guarantor->mobile = $client->mobile : $loan_guarantor->mobile = $request->mobile;
        (!empty($client)) ? $loan_guarantor->notes = $client->notes : $loan_guarantor->notes = $request->notes;
        (!empty($client)) ? $loan_guarantor->email = $client->email : $loan_guarantor->email = $request->email;
        (!empty($client)) ? $loan_guarantor->address = $client->address : $loan_guarantor->address = $request->address;
        (!empty($client)) ? $loan_guarantor->marital_status = $client->marital_status : $loan_guarantor->marital_status = $request->marital_status;
        (!empty($client)) ? $loan_guarantor->dob = $client->dob : $loan_guarantor->dob = $request->dob;
        $loan_guarantor->guaranteed_amount = $request->guaranteed_amount;
        $loan_guarantor->otp = $otp;
        if ($request->hasFile('photo')) {
            $file_name = $request->file('photo')->store('public/uploads/loans');
            $loan_guarantor->photo = basename($file_name);
        }
        $loan_guarantor->save();
     
        $msg ="Dear ".$client->first_name.' '.$client->last_name.". You have been added as loan guarantor for ".$client2->first_name.' '.$client2->last_name.". your verification code is : ".$otp."\r\nJOSAM SACCO,empowering all. ";


        $this->sendSms($client->mobile,$msg);
        activity()->on($loan_guarantor)
            ->withProperties(['id' => $loan_guarantor->id])
            ->log('Create Loan Guarantor');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('loan/' . $id . '/show');
    }
//
    //
      public function approve_guarantor(Request $request, $id){
    
        $q = DB::select("SELECT * FROM loan_guarantors  WHERE loan_id = ".$request->id." ");
      
            if($q){
               
                if((int)$request->otp  == (int)$q[0]->otp){
                DB::table('loan_guarantors')->where('loan_id', $id)->update(['otp' =>NULL,'status' =>'active']);

                 \flash(trans_choice("Successfully Verified", 1))->success()->important();
                 return redirect()->back();

            }else{
                \flash(trans_choice("Verifcation Code provided is not valid", 1))->error()->important();
                 return redirect()->back();
            }


            }

    



        
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        $loan_guarantor = LoanGuarantor::find($id);
        return theme_view('loan::guarantor.show', compact('loan_guarantor'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $titles = Title::all();
        $professions = Profession::all();
        $client_types = ClientType::all();
        $client_relationships = ClientRelationship::all();
        $clients = Client::where('status', 'active')->get();
        $countries = Country::all();
        $loan_guarantor = LoanGuarantor::find($id);
        return theme_view('loan::guarantor.edit', compact('titles', 'professions', 'client_types', 'client_relationships', 'clients', 'countries', 'loan_guarantor'));
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
            'first_name' => ['required_if:is_client,0'],
            'last_name' => ['required_if:is_client,0'],
            'gender' => ['required_if:is_client,0'],
            'email' => ['nullable','string', 'email', 'max:255'],
            'dob' => ['required_if:is_client,0', 'date'],
            'client_relationship_id' => ['required_if:is_client,0'],
            'photo' => ['nullable','image', 'mimes:jpg,jpeg,png'],
        ]);
        $client = Client::find($request->client_id);

        $q = DB::select("SELECT SUM(guaranteed_amount) as amount FROM loan_guarantors  WHERE client_id = ".$request->client_id." AND status ='pending' GROUP BY client_id ");
        if($q){
            //print_r($q);

            $bal =(int)$this->getLimits($client->mobile)-(int)$request->guaranteed_amount;
            $bal2 =(int)$this->getLimits($client->mobile)-((int)$q[0]->amount+(int)$request->guaranteed_amount);



            if($bal2 == 0){
                \flash(trans_choice("You cannot guarantee the loan. You have KES ".$bal2." to guarantee.   ", 1))->error()->important();
                return redirect()->back();
            }

            if($bal2 < 0){
                \flash(trans_choice("You cannot guarantee the loan. the quarannteed amount is more that available limit of KES ".$bal2.".   ", 1))->error()->important();
                return redirect()->back();
            }
           

        }
        $loan_guarantor = LoanGuarantor::find($id);
        $loan_guarantor->client_id = $request->client_id;
        $loan_guarantor->orgid = Auth::user()->orgid;
        $loan_guarantor->client_relationship_id = $request->client_relationship_id;
        (!empty($client)) ? $loan_guarantor->first_name = $client->first_name : $loan_guarantor->first_name = $request->first_name;
        (!empty($client)) ? $loan_guarantor->last_name = $client->last_name : $loan_guarantor->last_name = $request->last_name;
        (!empty($client)) ? $loan_guarantor->gender = $client->gender : $loan_guarantor->gender = $request->gender;
        (!empty($client)) ? $loan_guarantor->country_id = $client->country_id : $loan_guarantor->country_id = $request->country_id;
        (!empty($client)) ? $loan_guarantor->title_id = $client->title_id : $loan_guarantor->title_id = $request->title_id;
        (!empty($client)) ? $loan_guarantor->profession_id = $client->profession_id : $loan_guarantor->profession_id = $request->profession_id;
        (!empty($client)) ? $loan_guarantor->mobile = $client->mobile : $loan_guarantor->mobile = $request->mobile;
        (!empty($client)) ? $loan_guarantor->notes = $client->notes : $loan_guarantor->notes = $request->notes;
        (!empty($client)) ? $loan_guarantor->email = $client->email : $loan_guarantor->email = $request->email;
        (!empty($client)) ? $loan_guarantor->address = $client->address : $loan_guarantor->address = $request->address;
        (!empty($client)) ? $loan_guarantor->marital_status = $client->marital_status : $loan_guarantor->marital_status = $request->marital_status;
        (!empty($client)) ? $loan_guarantor->dob = $client->dob : $loan_guarantor->dob = $request->dob;
        $loan_guarantor->guaranteed_amount = $request->guaranteed_amount;
        if ($request->hasFile('photo')) {
            $file_name = $request->file('photo')->store('public/uploads/loans');
            $loan_guarantor->photo = basename($file_name);
        }
        $loan_guarantor->save();
        activity()->on($loan_guarantor)
            ->withProperties(['id' => $loan_guarantor->id])
            ->log('Update Loan Guarantor');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('loan/' . $loan_guarantor->loan_id . '/show');
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        $loan_guarantor = LoanGuarantor::find($id);
        $loan_guarantor->delete();
        activity()->on($loan_guarantor)
            ->withProperties(['id' => $loan_guarantor->id])
            ->log('Delete Loan Guarantor');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }
}
