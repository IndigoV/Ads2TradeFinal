<?php
/**
 * Created by PhpStorm.
 * User: happymore
 * Date: 8/22/2015
 * Time: 12:44 PM
 */
class workflow_status extends CI_Model {

    public function createStatus($data) {
        $this->db->insert('workflow_status', $data);
        return $this->db->insert_id();
    }

}