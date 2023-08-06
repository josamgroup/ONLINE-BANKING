<?php

namespace Modules\Core\Console;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Modules\Core\Entities\Menu;
use Modules\Setting\Entities\Setting;
use Nwidart\Modules\Facades\Module;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class InstallApplication extends Command
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'app:install';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Installs the application';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->info('Installing application');
        if (config('app.installed')) {
            $this->warn('Application already installed. If not then set APP_INSTALLED=false in .env to proceed');
        }
        {
            if (!$this->checkDatabaseConnection()) {
                $this->askDatabaseDetails();
            }
            $this->info("Database connection established");
            if (!Storage::disk('local')->exists('licence')) {
                //lets get licence details
                $this->askPurchaseCodeDetails();
            }
            $license = json_decode(file_get_contents(storage_path('app/licence')));
            $this->info("Purchase code verified");
            if ($license->active) {
                $this->install($license);
            }
        }

        return true;
    }

    public function askDatabaseDetails()
    {
        $host = $this->ask("Enter database host");
        $name = $this->ask("Enter database name");
        $username = $this->ask("Enter database username");
        $password = $this->ask("Enter database password");
        $port = $this->ask("Enter database port (usually 3306)");
        $default = config('database.default');
        config([
            "database.connections.{$default}.host" => $host,
            "database.connections.{$default}.database" => $name,
            "database.connections.{$default}.username" => $username,
            "database.connections.{$default}.password" => $password,
            "database.connections.{$default}.port" => $port
        ]);
        DB::reconnect();
        if (!$this->checkDatabaseConnection()) {
            $this->warn("Failed to connect to database, please reenter details");
            $this->askDatabaseDetails();
        }
        $path = base_path('.env');
        $env = file($path);

        $env = str_replace('DB_HOST=' . env('DB_HOST'), 'DB_HOST=' . $host, $env);
        $env = str_replace('DB_DATABASE=' . env('DB_DATABASE'), 'DB_DATABASE=' . $name, $env);
        $env = str_replace('DB_USERNAME=' . env('DB_USERNAME'), 'DB_USERNAME=' . $username, $env);
        $env = str_replace('DB_PASSWORD=' . env('DB_PASSWORD'), 'DB_PASSWORD=' . $password, $env);
        $env = str_replace('DB_PORT=' . env('DB_PORT'), 'DB_PORT=' . $port, $env);
        file_put_contents($path, $env);
        return true;
    }

    public function checkDatabaseConnection()
    {
        try {
            DB::connection()->getPdo();
            return true;
        } catch (\Exception $exception) {
            return false;
        }

    }

    public function askPurchaseCodeDetails()
    {
        $purchase_code_type = $this->choice('Please enter your purchase code type', ['envato', 'internal']);
        $purchase_code = $this->ask('Please enter your purchase code');
        $ip = gethostbyname(gethostname());
        $license_url = "https://webstudio.co.zw/license/get_license_status";
        try {
            $response = Http::post($license_url,
                [
                    'purchase_code_type' => $purchase_code_type,
                    'purchase_code' => $purchase_code,
                    'ip_address' => $ip,
                ]);
            if ($response->status() == 200) {
                //store license details
                file_put_contents(storage_path('app/licence'), $response->body());
                return true;
            }

            $this->warn($response['message']);
            $this->askPurchaseCodeDetails();
            return false;
        } catch (\Exception $exception) {
            $this->warn("Failed to verify license:" . $exception->getMessage());
            $this->askPurchaseCodeDetails();
        }
        return false;
    }

    public function install($license)
    {
        //migrate
        $modules = Module::getOrdered();
        foreach ($modules as $module) {
            Artisan::call('module:migrate', ['module' => $module->getName(), '--force' => true]);
            Artisan::call('module:seed', ['module' => $module->getName(), '--force' => true]);
        }
        //setup permissions and menus
        $this->info('Setting permissions and menus');
        foreach ($modules as $module) {
            $permissions = config($module->getLowerName() . '.permissions');
            if ($permissions) {
                foreach ($permissions as $key) {
                    if (!Permission::where('name', $key['name'])->first()) {
                        Permission::create($key);
                    }
                }
            }
            $admin = Role::findByName('admin');
            $admin->syncPermissions(Permission::all());
            //reconfigure menu
            $menus = config($module->getLowerName() . '.menus');
            Menu::where('module', $module->getName())->delete();
            if ($menus) {
                foreach ($menus as $menu) {
                    $m = new Menu();
                    $m->is_parent = $menu['is_parent'];
                    if ($menu['is_parent'] != 1) {
                        //find the parent
                        $parent = Menu::where('slug', $menu['parent_slug'])->first();
                        if (!empty($parent)) {
                            $m->parent_id = $parent->id;
                        }
                    }
                    $m->parent_slug = $menu['parent_slug'];
                    $m->name = $menu['name'];
                    $m->slug = $menu['slug'];
                    $m->module = $menu['module'];
                    $m->url = $menu['url'];
                    $m->icon = $menu['icon'];
                    $m->menu_order = $menu['order'];
                    $m->permissions = $menu['permissions'];
                    $m->save();
                }
            }
        }
        Setting::where('setting_key', 'core.installed_ip_address')->update(['setting_value' => $license->ip_address]);
        Setting::where('setting_key', 'core.purchase_code')->update(['setting_value' => $license->purchase_code]);
        Setting::where('setting_key', 'core.purchase_code_type')->update(['setting_value' => $license->purchase_code_type]);
        Setting::where('setting_key', 'core.license_details')->update(['setting_value' => json_encode($license)]);
        file_put_contents(storage_path('installed'), 'Welcome to ULM');
        $path = base_path('.env');
        $env = file($path);
        $env = str_replace('APP_INSTALLED=false', 'APP_INSTALLED=true', $env);
        file_put_contents($path, $env);
        $this->info('Application successfully installed');
    }

}
