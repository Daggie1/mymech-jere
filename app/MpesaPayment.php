<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MpesaPayment extends Model
{
    protected $fillable=['MerchantRequestID','ResultCode',
        'Amount','MpesaReceiptNumber','TransactionDate',
        'PhoneNumber'];
}
