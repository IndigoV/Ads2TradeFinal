<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class duration extends CI_Model {

    function getDudarion () {

		$select_query = $this->db->get('durations');
		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}  
    
	function getDurationText($days){
		$this->db->where('days',$days);
		$select_query = $this->db->get('durations');
		if ($select_query->num_rows > 0){
			//foreach ($select_query->result() as $row){
			//	$data[]=$row;
				$row =  $select_query->result();
			//}
			return $row;
		} else {
			return false;
		}		
	}
}


