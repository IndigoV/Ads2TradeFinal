<?php
/**
 * Created by PhpStorm.
 * User: happymore
 * Date: 8/22/2015
 * Time: 3:54 PM
 */
class rfp_for_submission_comment extends CI_Model {

    public function create($data) {
        $this->db->insert('rfp_for_submission_comments', $data);
        return $this->db->insert_id();
    }

    public function get_latest_comment($rfp_for_submission_id) {
        return $this->db->query("select * from rfp_for_submission_comments where rfp_for_submission_id = $rfp_for_submission_id order by created_at desc")->result()[0];
    }

}