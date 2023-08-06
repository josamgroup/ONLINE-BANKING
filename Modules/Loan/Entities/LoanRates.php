<?php

namespace Modules\Loan\Entities;

use Illuminate\Database\Eloquent\Model;

class LoanRates extends Model
{
    protected $fillable = [];
    public $table = "rates";

    // public function charge_type()
    // {
    //     return $this->hasOne(LoanChargeType::class, 'id', 'loan_charge_type_id');
    // }
    // public function charge_option()
    // {
    //     return $this->hasOne(LoanChargeOption::class, 'id', 'loan_charge_option_id');
    // }
}
