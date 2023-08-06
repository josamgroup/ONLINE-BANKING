<?php

namespace Modules\Installer\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Laracasts\Flash\Flash;
use Modules\Core\Entities\Menu;
use Modules\Setting\Entities\Setting;
use Nwidart\Modules\Facades\Module;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class InstallerController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        Artisan::call('cache:clear');
        Artisan::call('config:clear');
        Artisan::call('key:generate');
        Artisan::call('view:clear');
        return theme_view('installer::index');
    }

    public function requirements()
    {
        $requirements = [
            'PHP Version (>= 7.3)' => version_compare(phpversion(), '7.3', '>='),
            'OpenSSL Extension' => extension_loaded('openssl'),
            'BCMath PHP Extension' => extension_loaded('bcmath'),
            'Ctype PHP Extension' => extension_loaded('ctype'),
            'JSON PHP Extension' => extension_loaded('json'),
            'PDO Extension' => extension_loaded('PDO'),
            'PDO MySQL Extension' => extension_loaded('pdo_mysql'),
            'Mbstring Extension' => extension_loaded('mbstring'),
            'Tokenizer Extension' => extension_loaded('tokenizer'),
            'GD Extension' => extension_loaded('gd'),
            'Fileinfo Extension' => extension_loaded('fileinfo'),
            'Imagick Extension' => extension_loaded('imagick'),
            'XML PHP Extension' => extension_loaded('xml')
        ];
        $next = true;
        foreach ($requirements as $key) {
            if ($key == false) {
                $next = false;
            }
        }
        return theme_view('installer::requirements', compact('requirements', 'next'));
    }

    public function permissions()
    {
        $permissions = [
            'storage/app' => is_writable(storage_path('app')),
            'storage/framework/cache' => is_writable(storage_path('framework/cache')),
            'storage/framework/sessions' => is_writable(storage_path('framework/sessions')),
            'storage/framework/views' => is_writable(storage_path('framework/views')),
            'storage/logs' => is_writable(storage_path('logs')),
            'storage' => is_writable(storage_path('')),
            'bootstrap/cache' => is_writable(base_path('bootstrap/cache')),
            '.env file' => is_writable(base_path('.env')),
        ];
        $next = true;
        foreach ($permissions as $key) {
            if ($key == false) {
                $next = false;
            }
        }
        return theme_view('installer::permissions', compact('permissions', 'next'));
    }

    public function database(Request $request)
    {
        if ($request->isMethod('post')) {
            $credentials = array();
            $credentials["host"] = $request->host;
            $credentials["username"] = $request->username;
            $credentials["password"] = $request->password;
            $credentials["name"] = $request->name;
            $credentials["port"] = $request->port;
            $default = config('database.default');

            config([
                "database.connections.{$default}.host" => $credentials['host'],
                "database.connections.{$default}.database" => $credentials['name'],
                "database.connections.{$default}.username" => $credentials['username'],
                "database.connections.{$default}.password" => $credentials['password'],
                "database.connections.{$default}.port" => $credentials['port']
            ]);
            DB::reconnect();
            $path = base_path('.env');
            $env = file($path);

            $env = str_replace('DB_HOST=' . env('DB_HOST'), 'DB_HOST=' . $credentials['host'], $env);
            $env = str_replace('DB_DATABASE=' . env('DB_DATABASE'), 'DB_DATABASE=' . $credentials['name'], $env);
            $env = str_replace('DB_USERNAME=' . env('DB_USERNAME'), 'DB_USERNAME=' . $credentials['username'], $env);
            $env = str_replace('DB_PASSWORD=' . env('DB_PASSWORD'), 'DB_PASSWORD=' . $credentials['password'], $env);
            $env = str_replace('DB_PORT=' . env('DB_PORT'), 'DB_PORT=' . $credentials['port'], $env);
            file_put_contents($path, $env);
            try {
                DB::statement("SHOW TABLES");
                //connection made,lets install database
                return redirect('install/email');
            } catch (\Exception $e) {
                Log::info($e->getMessage());
                flash(trans('installer::general.install_database_failed'))->error();
                //copy(base_path('.env.example'), base_path('.env'));
                return redirect()->back()->with(["error" => trans('installer::general.install_database_failed')]);
            }

        }
        return theme_view('installer::database');
    }

    public function email(Request $request)
    {
        if ($request->isMethod('post')) {
            $credentials = array();
            $credentials["mail_driver"] = $request->mail_driver;
            $credentials["mail_host"] = $request->mail_host;
            $credentials["mail_password"] = $request->mail_password;
            $credentials["mail_username"] = $request->mail_username;
            $credentials["mail_port"] = $request->mail_port;
            $credentials["mail_encryption"] = $request->mail_encryption;
            $credentials["mail_from_address"] = $request->mail_from_address;
            $credentials["app_name"] = $request->app_name;

            $path = base_path('.env');
            $env = file($path);

            $env = str_replace('MAIL_DRIVER=' . env('MAIL_DRIVER'), 'MAIL_DRIVER=' . $credentials['mail_driver'], $env);
            $env = str_replace('MAIL_HOST=' . env('MAIL_HOST'), 'MAIL_HOST=' . $credentials['mail_host'], $env);
            $env = str_replace('MAIL_PORT=' . env('MAIL_PORT'), 'MAIL_PORT=' . $credentials['mail_port'], $env);
            $env = str_replace('MAIL_USERNAME=' . env('MAIL_USERNAME'), 'MAIL_USERNAME=' . $credentials['mail_username'], $env);
            $env = str_replace('MAIL_PASSWORD=' . env('MAIL_PASSWORD'), 'MAIL_PASSWORD=' . $credentials['mail_password'], $env);
            $env = str_replace('MAIL_ENCRYPTION=' . env('MAIL_ENCRYPTION'), 'MAIL_ENCRYPTION=' . $credentials['mail_encryption'], $env);
            $env = str_replace('MAIL_FROM_ADDRESS=' . env('MAIL_FROM_ADDRESS'), 'MAIL_FROM_ADDRESS=' . $credentials['mail_from_address'], $env);
            $env = str_replace('APP_NAME="' . env('APP_NAME') . '"', 'APP_NAME="' . $credentials['app_name'] . '"', $env);
            file_put_contents($path, $env);
            try {
                //connection made,lets install database
                return redirect('install/license');
            } catch (\Exception $e) {
                Log::info($e->getMessage());
                flash(trans('installer::general.install_email_failed'))->error();
                //copy(base_path('.env.example'), base_path('.env'));
                return redirect()->back()->with(["error" => trans('installer::general.install_email_failed')]);
            }

        }
        return theme_view('installer::email');
    }

    public function license(Request $request)
    {
        if ($request->isMethod('post')) {

            try {
                if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
                    $ip = $_SERVER['HTTP_CLIENT_IP'];
                } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
                } else {
                    $ip = $_SERVER['REMOTE_ADDR'];
                }
                $license_url = "https://webstudio.co.zw/license/get_license_status";
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
                    return redirect('install/installation');
                }
                flash($response['message'])->error();
                //copy(base_path('.env.example'), base_path('.env'));
                return redirect()->back()->with(["error" => $response['message']]);

            } catch (\Exception $e) {
                Log::error($e->getMessage());
                flash(trans('installer::general.install_licence_failed'))->error();
                //copy(base_path('.env.example'), base_path('.env'));
                return redirect()->back()->with(["error" => trans('installer::general.install_email_failed')]);
            }

        }
        return theme_view('installer::license');
    }

    public function installation(Request $request)
    {

        if ($request->isMethod('post')) {
            try {
                Artisan::call('app:install');
                return redirect('install/complete');
            } catch (\Exception $e) {
                Log::error($e->getMessage());
                Log::error($e->getTraceAsString());
                flash(trans('installer::general.install_error'))->error();
                return redirect()->back();
            }
        }
        return theme_view('installer::installation');
    }

    public function complete()
    {
        Artisan::call('view:clear');
        Artisan::call('cache:clear');
        Artisan::call('config:clear');
        return theme_view('installer::complete');
    }
}
