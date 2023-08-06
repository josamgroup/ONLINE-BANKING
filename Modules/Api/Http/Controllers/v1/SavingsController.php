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

class SavingsController extends Controller
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
