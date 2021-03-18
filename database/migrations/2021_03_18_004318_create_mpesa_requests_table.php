<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMpesaRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //{"MerchantRequestID":"14164-11294631-1","CheckoutRequestID":"ws_CO_180320210214589448","ResponseCode":"0","ResponseDescription":"Success. Request accepted for processing","CustomerMessage":"Success. Request accepted for processing"}}
        Schema::create('mpesa_requests', function (Blueprint $table) {
            $table->bigIncrements('id')->unsigned();
            $table->string('payment_method')->index();
            $table->bigInteger('order_id')->unsigned();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->string('MerchantRequestID');
            $table->string('CheckoutRequestID')->nullable(true);
            $table->string('ResponseCode');
            $table->text('ResponseDescription');
            $table->text('CustomerMessage');


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mpesa_requests');
    }
}
