<?php

namespace App\Http\Controllers\Frontend;

//use App\Models\OrderItem;
//use App\Models\Product;
//use App\Models\StkPushPayment;
//use App\SdkPushLog;
//
//use Cart;
use App\Models\Order;
use App\MpesaPayment;
use App\MpesaRequest;
use App\StkPushPayment;
use Illuminate\Http\Request;
//use App\Services\PayPalService;
//use App\Contracts\OrderContract;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;

class MpesaController extends Controller{

    /**
     * @param Request $request (user id and the amount to be paid)
     * @return false|string
     */

    public function stkPush(Request $request) //From AJAX call/android side, etc....start USSD pay request

    {
//        dd($request);
        $amount = '2';
            //$request['amount'];




        $phone_paying ='254791614457';
            //$request['phone_number'];


//remove 07 for those that come with it

        if ($this->startsWith($phone_paying, "07")) {

            $pos = strpos($phone_paying, "07");

            if ($pos !== false) {

                $phone_paying = substr_replace($phone_paying, "2547", $pos, 2);

            }


//$phone_paying=str_replace("0","254",$phone_paying);

        }




        $merchant_id = "174379"; //C2B Shortcode/Paybill

        $callback_url = "https://7fcb9af1.ngrok.io/api/callback"; //"https://linq.mobi/api/callback";

        $passkey = "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"; //Ask from Safaricom guys..


        $account_reference = $phone_paying;
        //random_int(878,890809);
        //$phone_paying; //like account number while paying via paybill

        $transaction_description = 'Pay for User:' . $phone_paying;



        $caller = "C2B_ONLINE";

        $content = "Phone: " . $phone_paying . " | Amount: " . $amount;

//Initiate PUSH

        $timestamp = date("YmdHis");

        $password = base64_encode($merchant_id . $passkey . $timestamp); //No more Hashing like before. this is a guideline from Saf

        $access_token = $this->getAccessToken();


        $curl = curl_init();

        $endpoint_url = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';

        curl_setopt($curl, CURLOPT_URL, $endpoint_url);

        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json', 'Authorization:Bearer ' . $access_token)); //setting custom header


        $curl_post_data = array(

            'BusinessShortCode' => $merchant_id,

            'Password' => $password,

            'Timestamp' => $timestamp,

            'TransactionType' => 'CustomerPayBillOnline',

            'Amount' => $amount,

            'PartyA' => $phone_paying,

            'PartyB' => $merchant_id,

            'PhoneNumber' => $phone_paying,

            'CallBackURL' => $callback_url,

            'AccountReference' => $account_reference,

            'TransactionDesc' => $transaction_description

        );


        $data_string = json_encode($curl_post_data);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($curl, CURLOPT_POST, true);

        curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);

        $curl_response = curl_exec($curl);
//        dd($curl_response);

        $result = json_decode($curl_response);
//        dd($result);


//        return $curl_response;


        if (array_key_exists("errorCode", $result)) { //Error
            return $result;
            //return view('site.pages.request_cancelled');

        } else if ("ResponseCode" == 0) { //Success
//create the pending request...

            //return view('site.pages.request_waiting');
            return response()->json(['result'=> $result]);

        } else {

            return view('site.pages.request_cancelled');

        }

    }


    /*
     * initial settings functions..callback/success/failure?
     * this method receives feedback from Safaricom after request
     * is successfully sent to user. But remember may cancel, low balance, pay etc
    */

    public function callback(Request $request)
    {

        Log::warning(json_encode($request->all()));

        $content = $request->all();

/*
 *
 * {"Body":
 *      {"stkCallback":
 *                  {"MerchantRequestID":"27542-10207640-1",
 *                  "CheckoutRequestID":"ws_CO_180320210809401795",
 *                  "ResultCode":0,
 *                  "ResultDesc":"The service request is processed successfully.",
 *                  "CallbackMetadata":
 *                      {"Item":
 *                      [
 *                          {"Name":"Amount","Value":1},.......................item0
 *                          {"Name":"MpesaReceiptNumber","Value":"PCI7SWF86N"},.......................item1
 *                          {"Name":"TransactionDate","Value":20210318081002},.......................item2
 *                          {"Name":"PhoneNumber","Value":254791614457}]}}}}.......................item3
 * */

        //get the resultcode to determine if the transaction was successful

        $resultCode = $content['Body']['stkCallback']['ResultCode'];
        $recepientNumber=$content['Body']['stkCallback']['CallbackMetadata']['Item'][1]['Value'];
        $amount=$content['Body']['stkCallback']['CallbackMetadata']['Item'][0]['Value'];
        if($resultCode == 0){
            MpesaPayment::create([
                "MerchantRequestID"=>$content['Body']['stkCallback']['MerchantRequestID'],
                "ResultCode"=>$content['Body']['stkCallback']['ResultCode'],
                "Amount"=>$amount,
                "MpesaReceiptNumber"=>$recepientNumber,
                "TransactionDate"=>$content['Body']['stkCallback']['CallbackMetadata']['Item'][3]['Value'],
                "PhoneNumber"=>$content['Body']['stkCallback']['CallbackMetadata']['Item'][3]['Value'],
            ]);
            $mpesaRequest=MpesaRequest::where('MerchantRequestID',$content['Body']['stkCallback']['MerchantRequestID'])->get()->last();
            $orderId=$mpesaRequest->order_id;
            $order=Order::find((int)$orderId);
            $order->is_paid=true;
            $order->is_accepted=true;

            $order->reference_id=$recepientNumber;
            $order->save();
            $package = $order->package;
        $commission = round($amount*config('settings.website_commission')/100, 2);
        if(empty($package->id) === false){
            $owner = $package->user;
            $owner->available_balance = $owner->available_balance + round( $amount - $commission, 2);
            $owner->total_earnings = $owner->total_earnings + round( $amount - $commission, 2);
            $owner->site_commissions = $owner->site_commissions + $commission;
            $owner->save();
        }
            //a successful transaction push
            //save the transactions in stk_push payments table
            //0- means transaction was successful
//            $stk_push_payments = new MpesaPayment;
//            $stk_push_payments->MpesaReceiptNumber = $content['Body']['stkCallback']['CallbackMetadata']['Item'][1]['Value'];
//            $stk_push_payments->phone = $content['Body']['stkCallback']['CallbackMetadata']['Item'][4]['Value'];
//            $stk_push_payments->amount = $content['Body']['stkCallback']['CallbackMetadata']['Item'][0]['Value'];
//            $stk_push_payments->ResultCode = $content['Body']['stkCallback']['ResultCode'];
//            $stk_push_payments->ResultDesc = $content['Body']['stkCallback']['ResultDesc'];
//            $stk_push_payments->status = 0;
//
//            $stk_push_payments->save();
//            $order= $this->storeOrderDetails($request);
//            return view('site.pages.success',$order);
            return ;
            //good point to notify a user that the payment was well received.
        } else{
            return;
            //good point to send a message to the person who triggered the payment with instructions to pay directly via paybill.
        }


    }


    /*
     * Validation
     * only accept payments of subscription amount multiples
    */


    public function validation(Request $request)
    {



        $identifier = "C2B_VALIDATION_RAW";

        $ip = $request->ip();

        $callback = new MpesaCallBack();

        $callback->ip = $ip;

        $callback->content = $request->getContent();

        $callback->caller = $identifier;

        $callback->save();


        $content = json_decode($request->getContent());

        //get VALIDATION Details..........

        $msisdn = $content->MSISDN;

        $transaction_amount = $content->TransAmount;

        $transaction_bill_ref_number = $content->BillRefNumber;//user_id

        $first_name = $content->FirstName;

        $middle_name = $content->MiddleName;

        $last_name = $content->LastName;


        //LOG THE DETAILS....

        $identifier = "C2B_VALIDATION_DETAILS";

        $detailed_content = "Names: " . $first_name . ", " . $middle_name . "," . $last_name . " | Phone: " . $msisdn . " | Amount: " . $transaction_amount;


        $callback = new MpesaCallBack();

        $ip = $request->ip();

        $callback->ip = $ip;

        $callback->content = $detailed_content;

        $callback->caller = $identifier;

        $callback->save();

        $loanee = Loan::join('app_users', 'loans.user_id', '=', 'app_users.id')
            ->select('loans.*', 'app_users.phone_number as phone number',
                'app_users.first_name as fname', 'app_users.second_name as sname',
                'app_users.surname as surname')
            ->get();

//        if (!($loanee->where('phone_number','=',$content->BillRefNumber)->exists()))
//        {
//            $result_code = "C2B0012";
//
//            $result_description = "Invalid Account Number";
//        }else{


        //initialize


        /*
         * check if user exists and amount is multiple of subscription amount
           if(!$this->orderNumberFound($transaction_bill_ref_number,$transaction_amount))
        */
//
//        $subscription=Subscription::get()->last()['amount'];

        if (!(AppUser::where('phone_number', '=', $content->BillRefNumber)->exists())) {

            $result_code = "C2B00012";

            $result_description = "Invalid Account number";

        } elseif ($content->TransAmount % 100 !== 0) {
            $result_code = "C2B00013";

            $result_description = "Invalid Amount";
        } else {
            $result_code = "0";

            $result_description = "Validation Service request accepted successfully";
        }



        $repay = new LoanRepaymentRequest();
        $repay->loan_id = 1;
        $repay->amount = 2;
        $repay->status = 1;
        $repay->save();

        return $this->validationResponse($result_code, $result_description);

    }


    public function validationResponse($result_code, $result_description)
    {

        $result = json_encode(["ResultDesc" => $result_description, "ResultCode" => $result_code]);

        $response = new Response();

        $response->headers->set("Content-Type", "application/json; charset=utf-8");

        $response->setContent($result);

        return $response;

    }


    //Confirmation

    public function confirmation(Request $request)
    {

        $identifier = "C2B_CONFIRMATION";
        $identifier2 = "MPESA_VERIFICATION";


        $callback = new MpesaCallBack();

        $ip = $request->ip();


//        update loan repayments request status


    }

    public function getAccessToken()
    {

        //Variables specific to this application

        $consumer_key = "iRZRiB8iKjHHVOk0bfQAJKWvmZSzP1GP"; //Get these two from DARAJA Platform


        $consumer_secret = "v6BpUkOBqrGcBZeJ";

        $credentials = base64_encode($consumer_key . ":" . $consumer_secret);

        $url = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';


        $curl = curl_init();

        curl_setopt($curl, CURLOPT_URL, $url);

        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Authorization: Basic ' . $credentials));

        curl_setopt($curl, CURLOPT_HEADER, false);//Make it not return headers...true retirns header

        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);//MAGIC..

        $curl_response = curl_exec($curl);

//        dd($curl_response);

        $access_token = json_decode($curl_response);

        return $access_token->access_token;

    }

    function startsWith($haystack, $needle)

    {

        $length = strlen($needle);

        return (substr($haystack, 0, $length) === $needle);

    }
    public function storeOrderDetails($params)
    {
        $order = Order::create([
            'order_number'      =>  'ORD-'.strtoupper(uniqid()),
            'user_id'           => auth()->user()->id,
            'status'            =>  'pending',
            'grand_total'       =>  Cart::getSubTotal(),
            'item_count'        =>  Cart::getTotalQuantity(),
            'payment_status'    =>  0,
            'payment_method'    =>  null,
            'first_name'        =>  $params['first_name'],
            'last_name'         =>  $params['last_name'],
            'address'           =>  $params['address'],
            'city'              =>  $params['city'],
            'country'           =>  $params['country'],
            'post_code'         =>  $params['post_code'],
            'phone_number'      =>  $params['phone_number'],
            'notes'             =>  $params['notes']
        ]);

        if ($order) {

            $items = Cart::getContent();

            foreach ($items as $item)
            {
                // A better way will be to bring the product id with the cart items
                // you can explore the package documentation to send product id with the cart
                $product = Product::where('name', $item->name)->first();

                $orderItem = new OrderItem([
                    'product_id'    =>  $product->id,
                    'quantity'      =>  $item->quantity,
                    'price'         =>  $item->getPriceSum()
                ]);

                $order->items()->save($orderItem);
            }
        }

        return $order;
    }

}
