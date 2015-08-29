<?php
//TODO: Maybe rename this to Common
/*
Handles:
- events 
- messaging
- any other header displays calculations
*/
class Events
{
	// hold CI instance
	private $CI;

	public function __construct()
	{
		$this->CI =& get_instance();
		
		//Load the sysevents model
		$this->CI->load->model('sysevents_model', 'sysevents');	
		//Load the messages model
		$this->CI->load->model('messages_model', 'messages');
		//Get this user's inbox count
	}

  public function log_event($user, $object_id, $event_date, $event_datails, $event_type=5)
  {
      //Event Types:
      /*
      1 Auction related events
      2 Bids related events
      3 Campaign related events
      4 News related events
      5 User related events
      6 Asset related events
      7 Invoices related events

      */
      //Create event object
		  $event = new stdClass;
  		$event->event_type = $event_type;
	   	$event->event_user = $user;
	 	  $event->event_object_id = is_numeric($object_id)?$object_id:0;  
	   	$event->event_date = $event_date;
		  $event->event_details = $event_datails;

      //Save event
      $this->CI->sysevents->save($event);
  }
  
  public function getEventsForObjectAndType($ObjectId, $EventTypeId){
    return $this->CI->sysevents->getByObjectAndEventTypeIds($ObjectId, $EventTypeId);  
  }
 
  /*Begin Messages related functions*/
  
  public function getCountUnreadMessages($user_id){
	 $isread = 0;
	 return $this->CI->messages->countAll($user_id, $isread);
  }
 
  public function getReadMessages($user_id){
	$isread = 1;
	 return $this->CI->messages->getAll($user_id, $isread);
  }

  public function getUnreadMessages($user_id){
	$isread = 0;
	 return $this->CI->messages->getAll($user_id, $isread);
  }

  public function getCountReadMessages($user_id){
	$isread = 1;
	 return $this->CI->messages->countAll($user_id, $isread);
  }
  
  public function getSentMessages($user_id){
	 return $this->CI->messages->getAllSent($user_id);
  }

  public function getCountSentMessages($user_id){
	 return $this->CI->messages->countAllSent($user_id);
  }
  
  /*End Messages related functions*/
  
  public function getEstimatedSpend($user_id){
	$estimatedSpend = 0;
	//Calc estimated spend & return result
	 return $estimatedSpend;
  } 
  
  public function sendMessage($message, $temp_message, $reply_of){
    return $this->CI->messages->send($message, $temp_message, $reply_of);
  }

  public function getById($message_id){
    return $this->CI->messages->getById($message_id);
  }

  public function markMessageAsRead($message_id, $read){
    return $this->CI->messages->markRead($message_id, $read);
  }

  /*
  * Used for generic system notifications messages, e.g. outbid, buy now, watchlist etc 
  */
  public function systemNotification($send_to, $subject, $message_body){
    $message = new stdClass;
    $temp_message = new stdClass;

    //Populate message details from posted values
    $message->sentfrom = 1; //The System Users ID
    $message->sentto = $send_to;
    $message->subject = $subject;
    $message->message = $message_body;
    $message->datetime = date('Y-m-d H:j:s');
    $message->public = 1;
    $message->reply_of = 0; //not a reply

    //echo is_array($message->sentto);

    //exit;
    //Send message
    $message_id = $this->CI->messages->send($message, $temp_message, $reply_of);

  }

  /*
  * Used for sending Buy Now notifications to the buyer and the media owner 
  */
  public function systemBuyNowNotification($buyer_id, $seller_id, $auction_id, $invoice_no, $invoice_amount, $invoice_description){
    $message = new stdClass;
    $temp_message = new stdClass;

    $invoice_amount = number_format($invoice_amount,2);
   //Send Notificatication messages
    //To buyer
    $send_to = $buyer_id;
    $subject = "You have BOUGHT an item on Auction : $invoice_description";
    $message_body = "
    Dear Advertiser,

    You have successfully bought an item on auction:

    Auction Details: $invoice_description
    ---------------------------------------------------------------------------------------------------------------------
    Invoice Details: 
    Invoice Number: #$invoice_no 
    Invoice Amount: $invoice_amount
    ---------------------------------------------------------------------------------------------------------------------
    Please make sure you make payment within the next 24 hours to avoid this sale being cancelled and deemed null and void.

    Use the AUC$invoice_no as your payment reference when making payment.

    Regards
    Ads2Trade
    ";

    //Populate message details from posted values
    $message->sentfrom = 1; //The System Users ID
    $message->sentto = $send_to;
    $message->subject = $subject;
    $message->message = $message_body;
    $message->datetime = date('Y-m-d H:j:s');
    $message->public = 1;
    $message->reply_of = 0; //not a reply

    //Send message
    $message_id = $this->CI->messages->send($message, $temp_message, $reply_of);

    //To Owner
    $send_to = $seller_id;
    $subject = "You have SOLD an item on Auction : $invoice_description";
    $message_body = "
    Dear Media Owner,

    You have successfully sold an item on auction:

    Auction Details: $invoice_description
    ---------------------------------------------------------------------------------------------------------------------
    Invoice Details: 
    Invoice Number: #$invoice_no 
    Invoice Amount: $invoice_amount
    ---------------------------------------------------------------------------------------------------------------------

    Regards
    Ads2Trade
    ";
    
    //Populate message details from posted values
    $message->sentfrom = 1; //The System Users ID
    $message->sentto = $send_to;
    $message->subject = $subject;
    $message->message = $message_body;
    $message->datetime = date('Y-m-d H:j:s');
    $message->public = 1;
    $message->reply_of = 0; //not a reply

    //Send message
    $message_id = $this->CI->messages->send($message, $temp_message, $reply_of);

    return $message_id;

  }

  /*
  * Used for sending Buy Now notifications to the buyer and the media owner 
  */
  public function systemBidNowNotification($outbid_user_id, $outbid_amt, $buyer_id, $seller_id, $auction_id, $invoice_no, $invoice_amount, $invoice_description){
    $message = new stdClass;
    $temp_message = new stdClass;

    $message->sentfrom = 1; //The System Users ID
    $message->datetime = date('Y-m-d H:j:s');
    $message->public = 1;
    $message->reply_of = 0; //not a reply

    $outbid_amt_raw = $outbid_amt;
    $invoice_amt_raw = $invoice_amount;

    $outbid_amt = number_format($outbid_amt,2);
    $invoice_amount = number_format($invoice_amount,2);

   //Send Notificatication messages

    if($invoice_amt_raw > $outbid_amt_raw){    //To buyer that has been outbid

        $send_to = $outbid_user_id;
        $subject = "You have been outBID on Auction : $invoice_description";
        $message_body = "
        Dear Advertiser,

        You have been outbid on Auction: $invoice_description

        ---------------------------------------------------------------------------------------------------------------------
        Your Bid Amount  : $outbid_amt
        Latest Bid Amount: $invoice_amount
        ---------------------------------------------------------------------------------------------------------------------

        Regards
        Ads2Trade
        ";

        //echo $buyer_id;

        //Populate message details from posted values
        if(!($buyer_id > 0)){
         $buyer_id = $this->CI->session->userdata('user_id');
        } 
        if(!($buyer_id > 0)){ //check use_id session variable if still no valid user id
         $buyer_id = $this->CI->session->userdata('use_id');
        }    

        //echo $buyer_id;

        $message->sentto = $buyer_id;
        $message->subject = $subject;
        $message->message = $message_body;

        //print_r($temp_message);

        //Send message
        $message_id = $this->CI->messages->send($message, $temp_message, $reply_of);
    }

    //To buyer
    if(!($buyer_id > 0)){
      $buyer_id = $this->CI->session->userdata('user_id');
    }
    if(!($buyer_id > 0)){
      $buyer_id = 33;
    }     
    $send_to = $seller_id;
    $subject = "You have BID on Auction : $invoice_description";
    $message_body = "
    Dear Advertiser,

    You have successfully placed a BID on an item on auction:

    ---------------------------------------------------------------------------------------------------------------------
    Auction Details  : $invoice_description
    Your Bid Amount  : $invoice_amount
    ---------------------------------------------------------------------------------------------------------------------

    Regards
    Ads2Trade
    ";

    //Populate message details from posted values

    $message->sentto = $send_to;
    $message->subject = $subject;
    $message->message = $message_body;

    //Send message
    $message_id = $this->CI->messages->send($message, $temp_message, $reply_of);

    //To Owner
    $send_to = $seller_id;
    $subject = "Bid place on auction $invoice_description";
    $message_body = "
    Dear Media Owner,

    A bid has been placed on your auction

    ---------------------------------------------------------------------------------------------------------------------
    Auction Details  : $invoice_description
    Latest Bid Amount: $invoice_amount
    ---------------------------------------------------------------------------------------------------------------------

    Regards
    Ads2Trade
    ";
    
    //Populate message details from posted values
    $message->sentto = $send_to;
    $message->subject = $subject;
    $message->message = $message_body;
    //Send message
    $message_id = $this->CI->messages->send($message, $temp_message, $reply_of);

    return $message_id;

  }

}
/* End of file Events.php */