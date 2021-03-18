<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MpesaRequest extends Model
{

    protected $fillable=['payment_method','MerchantRequestID','CheckoutRequestID','ResponseCode','ResponseDescription','CustomerMessage','order_id'];
}
