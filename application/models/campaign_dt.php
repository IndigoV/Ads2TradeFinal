<?php

    class campaign_dt extends CI_Model implements DatatableModel{
    	
		/**
		 * @ return
		 * 		Expressions / Columns to append to the select created by the Datatable library
		 */
		public function appendToSelectStr() {
			//_protect_identifiers needs to be FALSE in the database.php when using custom expresions to avoid db errors.
			//CI is putting `` around the expression instead of just the column names
				return array(
					//'cam_assets_qty'=>'concat(\'0000\',c.cam_id, \' \', c.cam_title)'
					'cam_assets_qty'=>'12'
				);
		}
    	
		public function fromTableStr() {
			return 'campaign c';
		}
    
	    /**
	     * @return
	     *     Associative array of joins.  Return NULL or empty array  when not joining
	     */
	    public function joinArray(){
	    	return array(
	    		//'campaign_transaction ct' => 'c.cam_id = ct.cam_id'
			);
	    }
	    
    /**
     * 
     *@return
     *  Static where clause to be appended to all search queries.  Return NULL or empty array
     * when not filtering by additional criteria
     */
    	public function whereClauseArray(){
    		return NULL;
    	}
   }
?>