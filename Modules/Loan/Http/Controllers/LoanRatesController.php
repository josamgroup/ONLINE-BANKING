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
use Modules\Loan\Entities\LoanRates;
use Modules\Loan\Entities\LoanChargeOption;
use Modules\Loan\Entities\LoanChargeType;
use Yajra\DataTables\Facades\DataTables;

class LoanRatesController extends Controller
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
        $data = LoanRates::latest()
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
                $query->where('rate', 'like', "%$search%");
                $query->orWhere('lower', 'like', "%$search%");
                $query->orWhere('upper', 'like', "%$search%");
                $query->orWhere('created_at', 'like', "%$search%");
              
            })
            ->paginate($perPage)
            ->appends($request->input());
        return theme_view('loan::loan_rate.index',compact('data'));
    }

    public function get_charges(Request $request)
    {    
         $bid =Auth::user()->orgid;
        $query = LoanCharge::leftJoin('currencies', 'currencies.id', 'loan_charges.currency_id')
            ->leftJoin('loan_charge_types', 'loan_charge_types.id', 'loan_charges.loan_charge_type_id')
            ->leftJoin('loan_charge_options', 'loan_charge_options.id', 'loan_charges.loan_charge_option_id')
            ->when($bid, function (Builder $query) use ($bid) {
                $roles  =Auth::user()->roles()->get();
                 $r =[];
                  foreach ($roles as $key) {
                    if($key->id == 4 ){
                        array_push($r, $key->id);
                    }
                  }
                if(count($r) === 0 ){
                $query->where('rates.orgid', $bid);
                }
                
            })
            ->selectRaw("loan_charges.*,currencies.name currency,loan_charge_types.name charge_type,loan_charge_options.name charge_option");

        return DataTables::of($query)->editColumn('action', function ($data) {
            $action = '<div class="btn-group"><button type="button" class="btn btn-info btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-navicon"></i></button> <ul class="dropdown-menu dropdown-menu-right" role="menu">';
            if (Auth::user()->hasPermissionTo('loan.loans.charges.edit')) {
                $action .= '<li><a href="' . url('loan/charge/' . $data->id . '/edit') . '" class="">' . trans_choice('core::general.edit', 2) . '</a></li>';
            }
            if (Auth::user()->hasPermissionTo('loan.loans.charges.destroy')) {
                $action .= '<li><a href="' . url('loan/charge/' . $data->id . '/destroy') . '" class="confirm">' . trans_choice('core::general.delete', 2) . '</a></li>';
            }
            $action .= "</ul></li></div>";
            return $action;
        })->editColumn('charge_type', function ($data) {
            if ($data->loan_charge_type_id == 1) {
                return trans_choice('loan::general.disbursement', 1);
            }
            if ($data->loan_charge_type_id == 2) {
                return trans_choice('loan::general.specified_due_date', 1);
            }
            if ($data->loan_charge_type_id == 3) {
                return trans_choice('loan::general.installment', 1) . ' ' . trans_choice('loan::general.fee', 2);
            }
            if ($data->loan_charge_type_id == 4) {
                return trans_choice('loan::general.overdue', 1) . ' ' . trans_choice('loan::general.installment', 1) . ' ' . trans_choice('loan::general.fee', 1);
            }
            if ($data->loan_charge_type_id == 5) {
                return trans_choice('loan::general.disbursement_paid_with_repayment', 1);
            }
            if ($data->loan_charge_type_id == 6) {
                return trans_choice('loan::general.loan_rescheduling_fee', 1);
            }
            if ($data->loan_charge_type_id == 7) {
                return trans_choice('loan::general.overdue_on_loan_maturity', 1);
            }
            if ($data->loan_charge_type_id == 8) {
                return trans_choice('loan::general.last_installment_fee', 1);
            }
        })->editColumn('charge_option', function ($data) {
            if ($data->loan_charge_option_id == 1) {
                return number_format($data->amount, 2) . ' ' . trans_choice('loan::general.flat', 1);
            }
            if ($data->loan_charge_option_id == 2) {
                return number_format($data->amount, 2) . ' % ' . trans_choice('loan::general.principal_due_on_installment', 1);
            }
            if ($data->loan_charge_option_id == 3) {
                return number_format($data->amount, 2) . ' % ' . trans_choice('loan::general.principal_interest_due_on_installment', 1);
            }
            if ($data->loan_charge_option_id == 4) {
                return number_format($data->amount, 2) . ' % ' . trans_choice('loan::general.interest_due_on_installment', 1);
            }
            if ($data->loan_charge_option_id == 5) {
                return number_format($data->amount, 2) . ' % ' . trans_choice('loan::general.total_outstanding_loan_principal', 1);
            }
            if ($data->loan_charge_option_id == 6) {
                return number_format($data->amount, 2) . ' % ' . trans_choice('loan::general.percentage_of_original_loan_principal_per_installment', 1);
            }
            if ($data->loan_charge_option_id == 7) {
                return number_format($data->amount, 2) . ' % ' . trans_choice('loan::general.original_loan_principal', 1);
            }
        })->editColumn('active', function ($data) {
            if ($data->active == 1) {
                return trans_choice('core::general.yes', 1);
            }
            if ($data->active == 0) {
                return trans_choice('core::general.no', 1);
            }
        })->editColumn('id', function ($data) {
            return '<a href="' . url('loan/charge/' . $data->id . '/show') . '">' . $data->id . '</a>';

        })->rawColumns(['id', 'action'])->make(true);
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        $charge_types = LoanChargeType::orderBy('id')->get();
        $charge_options = LoanChargeOption::orderBy('id')->get();
        $currencies = Currency::orderBy('name')->get();
        return theme_view('loan::loan_rate.create', compact('charge_types', 'charge_options', 'currencies'));
    }

    public function get_charge_types()
    {
        $charge_types = LoanChargeType::orderBy('id')->get();
        return response()->json(['data' => $charge_types]);
    }

    public function get_charge_options()
    {
        $charge_options = LoanChargeOption::orderBy('id')->get();
        return response()->json(['data' => $charge_options]);
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'lower' => ['required'],
            'upper' => ['required'],
            'rate' => ['required'],
        ]);
        $rates = new LoanRates();
        $rates->created_by_id = Auth::id();
        $rates->rate = $request->rate;
        $rates->upper = $request->upper;
        $rates->lower = $request->lower;
        $rates->orgid = Auth::user()->orgid;
      
        $rates->save();
        activity()->on($rates)
            ->withProperties(['id' => $rates->id])
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
        $loan_rate = LoanRates::find($id);
        return theme_view('loan::loan_rate.edit', compact('loan_rate'));
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
            // 'rate_id' => ['required'],
            'lower' => ['required'],
            'upper' => ['required'],
            'rate' => ['required'],
         
        ]);
        $loan_rate = LoanRates::find($id);
        $loan_rate->created_by_id =Auth::id();
        $loan_rate->rate = $request->rate;
        $loan_rate->lower = $request->lower;
        $loan_rate->upper = $request->upper;
        $loan_rate->orgid = Auth::user()->orgid;

        $loan_rate->save();
        activity()->on($loan_rate)
            ->withProperties(['id' => $loan_rate->id])
            ->log('Update Loan Rate');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('loan/rates');
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
            ->withProperties(['id' => $loan_charge->id])
            ->log('Delete Loan Rate');
        \flash(trans_choice("core::general.successfully_deleted", 1))->success()->important();
        return redirect()->back();
    }
}
