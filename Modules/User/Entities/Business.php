<?php

namespace Modules\User\Entities;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class Business extends Model
{
    protected $table = 'businesses';
    protected $fillable = ['name',"orgid","phone","email","status","v_code"];


    // public function asset_chart()
    // {
    //     return $this->hasOne(ChartOfAccount::class, 'id', 'asset_chart_of_account_id');
    // }

    // public function expense_chart()
    // {
    //     return $this->hasOne(ChartOfAccount::class, 'id', 'expense_chart_of_account_id');
    // }

    // public function branch()
    // {
    //     return $this->hasOne(Branch::class, 'id', 'branch_id');
    // }

    // public function created_by()
    // {
    //     return $this->hasOne(User::class, 'id', 'created_by_id');
    // }

    // public function expense_type()
    // {
    //     return $this->hasOne(ExpenseType::class, 'id', 'expense_type_id');
    // }
}
