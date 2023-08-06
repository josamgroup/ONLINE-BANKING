<?php

namespace Modules\Core\Http\Middleware;

use Carbon\Carbon;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Storage;

class LicenseVerification
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->is('license*') ||$request->is('login*') || App::environment('demo')) {
            return $next($request);
        }
        //verify license every monday
        if (Carbon::today()->is('Saturday')) {
            if (!Storage::disk('local')->exists('licence')) {
                flash("License Verification failed. Please verify your license.")->error();
                return redirect('license/verify');
            }
            $license = json_decode(file_get_contents(storage_path('app/licence')));
            if ($license->expires === false) {
                return $next($request);
            }
            if ($license->status === false) {
                flash("License Verification failed. Please verify your license.")->error();
                return redirect('license/verify');
            }
            if (Carbon::parse($license->end_date)->lessThan(Carbon::today())) {
                flash("License Verification failed. Your license has expired, Please verify your license.")->error();
                return redirect('license/verify');
            }

        }
        return $next($request);
    }
}
