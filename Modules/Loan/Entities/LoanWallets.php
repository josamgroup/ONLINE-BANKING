<?php

namespace Modules\Loan\Entities;

use Illuminate\Database\Eloquent\Model;

class LoanWallets extends Model
{
    protected $fillable = [];
    public $table = "client_wallets";

    // public function charge_type()
    // {
    //     return $this->hasOne(LoanChargeType::class, 'id', 'loan_charge_type_id');
    // }
    // public function charge_option()
    // {
    //     return $this->hasOne(LoanChargeOption::class, 'id', 'loan_charge_option_id');
    // }
}
