@extends('frontend.layouts.app')

@section('title')
   {{{  __('site_payment_failed') }}}
@endsection

@section('content')
<section class="py-2">
    <div class="container">
        <div class="card mt-2">
            <div class="card-body">
                <div class="title-header border-bottom p-2 clearfix">
                    <h3 class="card-title float-left">
                        Enter Your Mpesa pin To proceed
                    </h3>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="alert alert-success">
                            <h3>We sent you an mpesa popup . Enter your mpesa pin to complete the payment</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
