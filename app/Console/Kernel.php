<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\DB;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {

      
        //$schedule->command('campaigns:process')->timezone('Africa/Nairobi')->at('13:10');
        $schedule->command('campaigns:process')->everyMinute()->timezone('Africa/Nairobi');
        //$schedule->command('events:recur')->everyMinute();
        //$schedule->command('penalties:process')->everyMinute();
        //$schedule->command('savings:interest')->daily();
    }

    /**
     * Register the Closure based commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        require base_path('routes/console.php');
        $this->load(__DIR__ . '/Commands');
    }
}
