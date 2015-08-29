<?php
class shared_datatables extends CI_Controller {

    public function assets() {
        //Important to NOT load the model and let the library load it instead.  
        //echo "before loading datatables";
        //$this->load->library('Datatable');
        $this->load->library('Datatable', array('xxxmodel'=>'assets_dt', 'rowIdCol'=>'ac.ass_id'));
        //echo "Loaded datatables";
        //format array is optional, but shown here for the sake of example
        $json = $this->datatable->datatableJson(
            array(
                'a_date_col' => 'date',
                'a_boolean_col' => 'boolean',
                'a_percent_col' => 'percent',
                'a_currency_col' => 'currency'
            )
        );

        $this->output->set_header("Pragma: no-cache");
        $this->output->set_header("Cache-Control: no-store, no-cache");
        $this->output->set_content_type('application/json')->set_output(json_encode($json));

    }

}
?>