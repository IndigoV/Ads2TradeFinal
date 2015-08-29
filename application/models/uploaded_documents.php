<?php

    class Uploaded_documents extends CI_Model{

    function get_all_data_by_ass_id($ass_id){
             $query = $this->db->get_where('uploaded_documents', array('ass_id' => $ass_id));
             
            if($query->num_rows > 0){
                    foreach ($query->result() as $row){
                        $data[] = $row;
                    }
                    return $data;
                }
                else {
                    return false;
                }
        }
    }
