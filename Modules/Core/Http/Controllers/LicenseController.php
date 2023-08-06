<?php

namespace Modules\Core\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class LicenseController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);

    }

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        return view('core::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function verify(Request $request)
    {
        $license = '';
        $message = "We failed to verify your license. Please enter your purchase details below.";
        if (Storage::disk('local')->exists('licence')) {
            $license = json_decode(file_get_contents(storage_path('app/licence')));
        }
        if ($license) {
            $expiryDate=Carbon::parse($license->end_date);
            if ($license->expires && $expiryDate->lessThan(Carbon::today())) {
                $message = "License  expired on {$expiryDate}. Please enter a new license below";
            }
        }
        if ($request->isMethod('post')) {

            try {
                if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
                    $ip = $_SERVER['HTTP_CLIENT_IP'];
                } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
                } else {
                    $ip = $_SERVER['REMOTE_ADDR'];
                }
                $license_url = "https://www.webstudio.co.zw/license/get_license_status";
                $response = Http::post($license_url,
                    [
                        'purchase_code_type' => $request->purchase_code_type,
                        'purchase_code' => $request->purchase_code,
                        'ip_address' => $ip,
                    ]);
                if ($response->status() == 200) {
                    //store license details
                    file_put_contents(storage_path('app/licence'), $response->body());
                    flash($response['message'])->success();
                    return redirect('dashboard');
                }
                flash($response['message'])->error();
                //copy(base_path('.env.example'), base_path('.env'));
                return redirect()->back();

            } catch (\Exception $e) {
                Log::error($e->getMessage());
                flash(trans('installer::general.install_licence_failed'))->error();
                //copy(base_path('.env.example'), base_path('.env'));
                return redirect()->back();
            }

        }
        return theme_view('core::license.verify', compact('message', 'license'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('core::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('core::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }
}
