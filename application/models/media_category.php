<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class media_category extends CI_Model {
    //Data tables
    protected $media_category_table = "media_category";
    protected $master_medium_type_table = "master_medium_type";
    protected $media_family_table = "media_family";

    function getDescription($description) {
        $select_query = $this->db->get_where('media_categories', array('description' => $description));
        if($select_query->num_rows > 0) {
            $count = 0;
            foreach($select_query->result() as $row) {
                $data[$count] = $row->description;
                $count++;
            }
            return $data;
        }
        return false;
    }

    function getMediaCat(){
        $query = $this->db->get('media_categories');
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        }
        else {
            $query->free_result();
            return false;
        }
    }

    //Get all the media categories  
    function getMediaCategories() {

        $select_query = $this->db->get('media_category');

        if ($select_query->num_rows > 0) {
            foreach ($select_query->result() as $row) {
                $data[] = $row;
            }

            return $data;
        } else {
            return false;
        }
    }

    function getMediaFamilies() {

        $select_query = $this->db->query('SELECT * FROM media_family');
        $result = $select_query->result();
//        print_r($result);
        return $result;
//        if ($select_query->num_rows > 0) {
//            foreach ($select_query->result() as $row) {
//                $data[] = $row;
//            }
//
//            return $data;
//        } else {
//            return false;
//        }
    }

    function getMediaCategoriesByCampaignID($category_id) {

        $query = $this->db->query("SELECT * FROM campaign_transaction WHERE cam_id = '". $category_id ."'");

//        echo '<pre>';
//        var_dump($query->result());
//        echo '</pre>';
        $alreadyIn = array();
        $allIds = array();
        $count = 0;
        foreach($query->result() as $result) {
            if(!in_array($result->mec_id, $alreadyIn)) {
                $alreadyIn[] = $result->mec_id;
                $allIds[$count]['id'] = $result->mec_id;
                $allIds[$count]['description'] = $this->getMediaCategoryNameById($result->mec_id);
                $allIds[$count]['family'] = $this->getMediaFamilyNameById($result->mec_id)->mef_description;
                $count++;
            }
        }
        return $allIds;
    }

    function getMediaFamilyNameById($id) {
        $mefId = $this->db->query("SELECT mef_id FROM media_category WHERE mec_id = '" . $id ."'")->result();
        $mef_id = 0;
        foreach($mefId as $mi) {
            $mef_id = $mi->mef_id;
        }
        $query = $this->db->query("SELECT mef_description FROM media_family WHERE mef_id = '" . $mef_id ."'")->result();
        return $query[0];
    }

    function getMediaCategoryNameById($id) {
        $query = $this->db->query("SELECT mec_description FROM media_category WHERE mec_id = '" . $id ."'");
        //return $query->result()[0];
        foreach ($query->result() as $row){		
			return $row->mec_description; 	
		} 
    }

    function getMediaCategoriesAvgPricesByID($category_id) {
        /*
        $this->db->where('mc.mec_id', $category_id);
        $this->db->select('mc.mec_id, mc.mec_description, AVG(ag.asg_min_price) as min_price, AVG(ag.asg_max_price) AS max_price');
        $this->db->from('media_category mc');
        $this->db->join("asset_size asi","mc.mec_id = asi.mec_id","left");
        $this->db->join("asset_group ag","asi.asi_id = ag.asi_id","left");
        $this->db->group_by(array('mc.mec_id','mc.mec_description'));
        */
        
        $query_mec_prices = "SELECT `mc`.`mec_id`, `mc`.`mec_description`, IFNULL(AVG(`ag`.`asg_min_price`),0) AS asg_min_price, IFNULL(AVG(`ag`.`asg_max_price`),0) AS asg_max_price 
                             FROM (`media_category` mc) 
                             LEFT JOIN `asset_size` asi ON `mc`.`mec_id` = `asi`.`mec_id` 
                             LEFT JOIN `asset_group` ag ON `asi`.`asi_id` = `ag`.`asi_id` 
                             WHERE `mc`.`mec_id` ='".$category_id."'
                             GROUP BY `mc`.`mec_id`, `mc`.`mec_description`";

        $select_query = $this->db->query($query_mec_prices);  

        //echo $this->db->last_query(); 
        //exit;
        //$select_query = $this->db->get('asset_size');

        if ($select_query->num_rows > 0) {
            foreach ($select_query->result() as $row) {
                $data[] = $row;
            }

            return $data;
        } else {
            return false;
        }

    }

    function getAllIds($data) {
        //$this->db->where('mec_description' , $data)
        $allIds = array();
        foreach($data as $d) {

            $select_query = $this->db->query('SELECT mec_id FROM media_category WHERE mec_description = "' . $d .'"');
            if($select_query->num_rows > 0) {
                foreach ($select_query->result() as $row) {
                    $allIds[] = $row;
                }
            }
        }
        if(!empty($allIds)) {
            return $allIds;
        } else {
            return false;
        }
    }


    function getIDs($data) {
        //$this->db->where('mec_description' , $data)
        $select_query = $this->db->query('media_category', array('mec_description' => $data));

        if ($select_query->num_rows > 0) {
            foreach ($select_query->result() as $row) {
                $data = $row;
            }

            return $data;
        } else {
            return false;
        }
    }

    public function getMediaCategoriesByFamily($ids = "") {
        // SELECT * FROM media_categories INNER JOIN media_family ON media_categories.media_family_id = media_family.mef_id
        // get all words / category types (print, digital or traditional)
        $words = explode(',', $ids);
        // if no words / category types found,
        if(count($words) == 0 || $ids == "" || $ids == null) {
            $query = $this->db->query('SELECT * FROM media_category INNER JOIN media_family ON media_category.mef_id = media_family.mef_id');
        } else {
            $q = "";
            // for each word, create a where clause
            for($i = 0; $i < count($words); $i++ ) {
                if($i == 0) {
                    // first word in the sequence, so add it as the origianl / first WHERE argument
                    $q .= 'WHERE mef_description LIKE \'%' . $words[$i] . '%\'';
                } else {
                    // not the first word in the sequence, add it as an additional argument in the WHERE clause
                    $q .= ' OR mef_description LIKE \'%' . $words[$i] . '%\'';
                }
            }
            $query = $this->db->query('SELECT * FROM media_category INNER JOIN media_family ON media_category.mef_id = media_family.mef_id ' . $q);
        }

        if(empty($query)) {
            return null;
        }
        return $query->result();
    }

    function getMediaOwners() {
        $query = $this->db->query("SELECT * FROM user WHERE ust_id = 2");
        return $query->result();
    }

    function getMediaCategoryNameFromID($id) {
        $query = $this->db->query("SELECT * FROM media_categories WHERE mec_id = '". $id ."'");
        return $query->result()[0]->description;
 //     $row = $query->result();
//        print_r($row[0]);
//        exit;
//       return $row['description'];
    }

    function getType($id) {

    }
}