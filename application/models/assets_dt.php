<?php
class assets_dt extends MY_Model implements DatatableModel{


        public function appendToSelectStr() {
            /*
                return array(
                    'city_state_zip' => 'concat(s.s_name, \'  \', c.c_name, \'  \', c.c_zip)'
                );
            */
            return NULL;
        }

        public function fromTableStr() {
            return 'assets as';
        }



        public function joinArray(){
            return array(
              'media_category mc|inner'=>'as.mec_id = mc.mec_id'
              );
        }

        public function whereClauseArray(){
            return array(
                'as.use_id' => $this->session->userdata('use_id') 
                );
        }
   }
?>