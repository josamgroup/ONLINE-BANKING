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
use Modules\Loan\Entities\LoanWallets;
//use Illuminate\Support\Facades\DB
use DB;
use Yajra\DataTables\Facades\DataTables;

class LoanWalletsController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:loan.loans.charges.index'])->only(['index', 'show']);
        $this->middleware(['permission:loan.loans.charges.create'])->only(['create', 'store']);
        $this->middleware(['permission:loan.loans.charges.edit'])->only(['edit', 'update']);
        $this->middleware(['permission:loan.loans.charges.destroy'])->only(['destroy']);

        $this->middleware(['permission:wallet.wallets.index'])->only(['index', 'show', 'get_wallets']);
        $this->middleware(['permission:wallet.wallets.create'])->only(['create', 'store']);
        $this->middleware(['permission:wallet.wallets.edit'])->only(['edit', 'update', 'change_savings_officer']);
        $this->middleware(['permission:wallet.wallets.destroy'])->only(['destroy']);
        $this->middleware(['permission:wallet.wallets.approve_savings'])->only(['approve_savings', 'undo_approval', 'reject_savings', 'undo_rejection']);
        $this->middleware(['permission:wallet.wallets.activate_savings'])->only(['activate_savings', 'undo_activation']);
        $this->middleware(['permission:wallet.wallets.withdraw_savings'])->only(['withdraw_savings', 'undo_withdrawn']);
        $this->middleware(['permission:wallet.wallets.inactive_savings'])->only(['inactive_savings', 'undo_inactive']);
        $this->middleware(['permission:wallet.wallets.dormant_savings'])->only(['dormant_savings', 'undo_dormant']);
        $this->middleware(['permission:wallet.wallets.close_savings'])->only(['close_savings', 'undo_closed']);
        $this->middleware(['permission:wallet.wallets.transactions.create'])->only(['create_transaction', 'store_transaction', 'create_deposit', 'store_deposit', 'create_savings_linked_charge', 'store_savings_linked_charge', 'pay_charge', 'store_pay_charge', 'create_withdrawal', 'store_withdrawal']);
        $this->middleware(['permission:wallet.wallets.transactions.edit'])->only(['waive_interest', 'update_transaction', 'edit_transaction', 'waive_charge', 'edit_deposit', 'update_deposit', 'edit_withdrawal', 'update_withdrawal']);
        $this->middleware(['permission:wallet.wallets.transactions.destroy'])->only(['destroy_transaction', 'reverse_transaction']);

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
        $data = LoanWallets::latest()
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
                $query->where('WalletID', 'like', "%$search%");
                $query->orWhere('AccountID', 'like', "%$search%");
                $query->orWhere('balance', 'like', "%$search%");
                $query->orWhere('created_at', 'like', "%$search%");
              
            })
            ->paginate($perPage)
            ->appends($request->input());
        return theme_view('loan::loan_wallet.index',compact('data'));
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
        $loan_charge = new LoanWallets();
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
        return redirect('loan/wallets');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        $rate = LoanRates::find($id);
        return theme_view('loan::loan_wallet.show', compact('rate'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $loan_wallet =DB::table('client_wallets')->where('WalletID', $id)->first(); //LoanRate::find($id);
        return theme_view('loan::loan_wallet.edit', compact('loan_wallet'));
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
            'AccountID' => ['required'],
            'current' => ['required'],
            'balance' => ['required'],
            
        ]);
        $loan_wallet =DB::table('client_wallets')->where('AccountID', $request->AccountID)->first();// LoanRates::find($id);
        ///print_r($loan_wallet);exit;
        $current =(int)$loan_wallet->balance + (int)$request->balance;
        $wallet =DB::table('client_wallets')->where('AccountID', $request->AccountID)->update(['balance' =>DB::raw($current)]);
        // $current =(int)$loan_wallet->balance + (int)$request->balance;
        // $wallet =DB::statement("UPDATE client_wallets SET balance =".$current."  where AccountID = ".$request->AccountID." ");
        // $loan_wallet->balance = 
        // $loan_wallet->save();
        // activity()->on($loan_wallet)
        //     ->withProperties(['id' => $loan_wallet->WalletID])
        //     ->log('Update Loan wallets');
        \flash(trans_choice("core::general.successfully_saved", 1))->success()->important();
        return redirect('loan/wallets');
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
