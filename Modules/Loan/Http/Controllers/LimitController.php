<?php

namespace Modules\Loan\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Laracasts\Flash\Flash;
use Modules\Core\Entities\Currency;
use Modules\Loan\Entities\Fund;
use Modules\Loan\Entities\LoanLimits;
// use Modules\Loan\Entities\LoanChargeOption;
// use Modules\Loan\Entities\LoanChargeType;
use Yajra\DataTables\Facades\DataTables;

class LimitController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:loan.loans.charges.index'])->only(['index', 'show']);
        $this->middleware(['permission:loan.loans.charges.create'])->only(['create', 'store']);
        $this->middleware(['permission:loan.loans.charges.edit'])->only(['edit', 'update']);
        $this->middleware(['permission:loan.loans.charges.destroy'])->only(['destroy']);

    }

    /**
     * Display a listing of the resource.
     * @return Response
     */






    public function index(Request $request)
    {
        $perPage = $request->per_page ?: 20;
        $orderBy = $request->order_by;
        $orderByDir = $request->order_by_dir;
        $search = $request->s;
        $bid =Auth::user()->orgid;
        $data = LoanLimits::latest()
         ->when($bid, function (Builder $query) use ($bid) {
                $roles  =Auth::user()->roles()->get();
                 $r =[];
                  foreach ($roles as $key) {

                    if($key->id == 4 ){
                        array_push($r, $key->id);
                    }
                  }
            if(count($r) === 0 ){
                $query->where('orgid', $bid);
                }
                
            })
            ->when($orderBy, function (Builder $query) use ($orderBy, $orderByDir) {
                $query->orderBy($orderBy, $orderByDir);
            })
            ->when($search, function (Builder $query) use ($search) {
                $query->where('phone', 'like', "%$search%");
                $query->orWhere('id_number', 'like', "%$search%");
                $query->orWhere('limit_amount', 'like', "%$search%");
                $query->orWhere('status', 'like', "%$search%");
                $query->orWhere('created_at', 'like', "%$search%");
                $query->orWhere('updated_at', 'like', "%$search%");
              
            })
            ->paginate($perPage)
            ->appends($request->input());
        return theme_view('loan::limits.index',compact('data'));
    }

   




    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'rate_id' => ['required'],
            'lower' => ['required'],
            'upper' => ['required'],
            'rate' => ['required'],
        ]);
        $loan_charge = new LoanRates();
        $loan_charge->created_by_id = Auth::id();
        $loan_charge->currency_id = $request->currency_id;
        $loan_charge->loan_charge_type_id = $request->loan_charge_type_id;
        $loan_charge->loan_charge_option_id = $request->loan_charge_option_id;
        $loan_charge->name = $request->name;
        $loan_charge->amount = $request->amount;
        $loan_charge->is_penalty = $request->is_penalty;
        $loan_charge->active = $request->active;
        $loan_charge->allow_override = $request->allow_override;
        $loan_charge->orgid =Auth::user()->orgid;
        $loan_charge->save();
        activity()->on($loan_charge)
            ->withProperties(['id' => $loan_charge->id])
            ->log('Create Loan Rate');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('loan/rates');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        $rate = LoanRates::find($id);
        return theme_view('loan::loan_rate.show', compact('rate'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $limit = LoanLimits::find($id);
        // $charge_types = LoanChargeType::orderBy('id')->get();
        // $charge_options = LoanChargeOption::orderBy('id')->get();
        // $currencies = Currency::orderBy('name')->get();
        return theme_view('loan::limits.edit', compact('limit'));
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
            'limit_amount' => ['required'],
      
        ]);
        $limit = LoanLimits::find($id);
        $limit->limit_amount = $request->limit_amount;
        $limit->orgid = Auth::user()->orgid;
        $limit->save();
        activity()->on($limit)
            ->withProperties(['id' => $limit->id])
            ->log('Update Loan Limit');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('loan/limits');
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        $loan_charge = LoanRates::find($id);
        $loan_charge->delete();
        activity()->on($loan_charge)
            ->withProperties(['id' => $loan_charge->rate_id])
            ->log('Delete Loan Rate');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }
}
