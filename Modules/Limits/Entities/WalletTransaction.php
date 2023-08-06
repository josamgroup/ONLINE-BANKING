<?php

namespace Modules\Limits\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Core\Entities\PaymentDetail;
use Modules\User\Entities\User;

class WalletTransaction extends Model
{
    protected $fillable = [];
    protected $table = 'loan_limits';

    public function payment_detail()
    {
        return $this->hasOne(PaymentDetail::class, 'id', 'payment_detail_id');
    }

    public function limits()
    {
        return $this->hasOne(Limits::class, 'id', 'loan_id');
    }

    public function created_by()
    {
        return $this->hasOne(User::class, 'id', 'created_by_id');
    }
}
