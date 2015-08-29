<?php

//following class accesses the messages table
class Messages_model extends CI_Model {
	protected $messages_table = "messages";
	protected $messages_cc_table = "messages_cc";
	protected $user_table = "user";

	/*
	Get this user's messages
	@param 		user_id 	int
	@param 		isread   int (0 = all unread messages, 1 - all read messages)
	@returns 	recordset - list of emails
	*/
	public function getAll($user_id, $isread=0) {
		//Get this user's messages
		$this->db->where("m.isread", $isread);
		$this->db->where("m.sentto", $user_id);
		
		$this->db->select("m.*,uf.use_first_name,uf.use_last_name,uf.use_email,ut.use_first_name,ut.use_last_name,ut.use_email");
		$this->db->from($this->messages_table." m");
		$this->db->join($this->user_table.' uf', 'm.sentfrom = uf.use_id');
		$this->db->join($this->user_table.' ut', 'm.sentto = ut.use_id');

		$query = $this->db->get();          

		//echo $this->db->last_query(); 

		if(empty($query)) {
			return null;
		}
		return $query->result();
	}

	/*
	Count this user's messages
	@param 		user_id 	int
	@param 		isread   int (0 = all unread messages, 1 - all read messages)
	@returns 	recordset - list of emails
	*/
	public function countAll($user_id, $isread=0) {
		//Count this users messages
		$this->db->where("m.isread", $isread);
		$this->db->where("m.sentto", $user_id);

		$this->db->select("m.*");
		$this->db->from($this->messages_table." m");

		$query = $this->db->get();   
		
		return $query->num_rows();
	}

	/*
	Get this user's messages
	@param 		user_id 	int
	@returns 	recordset - list of emails
	*/
	public function getAllSent($user_id) {
		//Get this user's sent messages
		$this->db->where("m.sentfrom", $user_id);
		
		$this->db->select("m.*,uf.use_first_name,uf.use_last_name,uf.use_email,ut.use_first_name,ut.use_last_name,ut.use_email");
		$this->db->from($this->messages_table." m");
		$this->db->join($this->user_table.' uf', 'm.sentfrom = uf.use_id');
		$this->db->join($this->user_table.' ut', 'm.sentto = ut.use_id');

		$query = $this->db->get();          
		if(empty($query)) {
			return null;
		}
		return $query->result();
	}

	/*
	Count this user's sent messages
	@param 		user_id 	int
	@returns 	recordset - list of emails
	*/
	public function countAllSent($user_id, $isread=0) {
		//Count this users messages
		$this->db->where("m.sentfrom", $user_id);
		
		$this->db->select("m.*");
		$this->db->from($this->messages_table." m");

		$query = $this->db->get();   
		
		return $query->num_rows();
	}
	
    public function send($message = null, $temp_message = null, $reply_of=0) {
		$message_id = 0;
		$temp_message = new stdClass;

    	if(is_array($message->sentto)){
    		$first_time = 1;
    		foreach($message->sentto as $key=>$sentto){
    			if($first_time == 1){

    				$first_time = 0;

    				$temp_message->sentfrom = $message->sentfrom;
    				$temp_message->sentto = $sentto;
    				$temp_message->subject = $message->subject;
    				$temp_message->message = $message->message;
    				//$temp_message->datetime = $message->datetime;
    				$temp_message->public = $message->public;
    				$temp_message->fromemail = '.';
    				$temp_message->sentat = $message->datetime;
    				$temp_message->reply_of = $message->reply_of;
    				$reply_of = $temp_message->reply_of;
    				//create new message record
    				$this->db->insert($this->messages_table, $temp_message);

    				//Save message id for use with CCs
    				$message_id = $this->db->insert_id();

    			} else {

    				//This is a CC
    				$cc_message = new stdClass;
    				$cc_message->message_id = $message_id;
    				$cc_message->sentto_id = $sentto;

          			$this->db->insert($this->messages_cc_table, $cc_message);  

    			}
    		}
    	} else {

			$temp_message->sentfrom = $message->sentfrom;
			$temp_message->sentto = $message->sentto;
			$temp_message->subject = $message->subject;
			$temp_message->message = $message->message;
			//$temp_message->datetime = $message->datetime;
			$temp_message->public = $message->public;
			$temp_message->fromemail = '.';
			$temp_message->sentat = $message->datetime;
			$temp_message->reply_of = $message->reply_of;
			$reply_of = $temp_message->reply_of;

			if($temp_message->sentto <=0 ){
				$temp_message->sentto = $this->session->userdata('user_id');;
			}

			//print_r($temp_message);
			//create new message record
			$this->db->insert($this->messages_table, $temp_message);

			//Save message id for use with CCs
			$message_id = $this->db->insert_id();

    	}

    	//Mark replied mesaages as read (if not already)
    	if($reply_of>0){
    		//
    		$msg_data = array('replied' => 1, 'isread' => 1);
			$msg_where = "id ='".$reply_of."'"; 
			$update_message = $this->db->update_string($this->messages_table, $msg_data, $msg_where); 
			$this->db->query($update_message);
    	}
    	return $message_id;
            
    }

    public function getById($id) {
        //$this->db->select("m.*");
        //$this->db->from($this->messages_table." m");
		$this->db->select("m.*,uf.use_first_name from_first,uf.use_last_name from_last,uf.use_email from_email,ut.use_first_name to_first,ut.use_last_name to_last,ut.use_email to_email");
		$this->db->from($this->messages_table." m");
		$this->db->join($this->user_table.' uf', 'm.sentfrom = uf.use_id');
		$this->db->join($this->user_table.' ut', 'm.sentto = ut.use_id');
        //Conditions
        $this->db->where("m.id", $id);
        $query = $this->db->get();     
        $row =  $query->row();       
        if(empty($row)) {
            return null;
        }
        //print_r($row); exit;
        return $row;
    }

    public function markRead($id, $read=1){

    	    $msg_data = array('isread' => $read);
			$msg_where = "id ='".$id."'"; 
			$update_message = $this->db->update_string($this->messages_table, $msg_data, $msg_where); 
			$this->db->query($update_message);
			
			return $this->db->affected_rows();
    }
    /*
    public function getEventTypes($active=1) {
        
        $this->db->select("et.*");
        $this->db->from($this->events_types_table." et");
		
		$this->db->where("et.active", $active);
        $query = $this->db->get();     
        ///$row =  $query->row();       
        if(empty($row)) {
            return null;
        }
        return $query->result();
    }

	public function delete($event = null) {
	
		if( isset($event->id) and ($event->id != null or !empty($event->id)) ) {
			$event->deleted = 1;
			$this->db->where("id", $event->id);
            $this->db->update($this->events_table, $event);
		}
	}
   */
}