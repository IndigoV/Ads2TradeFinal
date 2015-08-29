<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

error_reporting(E_ALL);
ini_set("error_reporting", E_ALL);

class pdf_test extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        //$this->load->library('Pdf');
        $this->load->model('province');
        $this->load->model('town');
        $this->load->model('asset_type');
        $this->load->model('assssssetsi');
        $this->load->library('googlemaps');
        $this->load->model('duration');
        $this->load->model('auction');
        $this->load->model('ajax_asset');
        $this->load->model('bids');

    }

    public function index()
    {

        $data = array();

        $html = $this->load->view('spec_sheet_new', $data, true);
        //$html = '';

        //make_pdf helper from tcpdf_helper that used the Pdf library (custom extension of tcpdf)
        make_pdf($html, 'Asset_Specsheet','Ads2Trade - Asset Specsheet #600', 'L');
        //echo $html;

    }

    public function specsheet(){

        $data = array();

        $html = $this->load->view('spec_sheet_new', $data, true);

        $this->html2pdf($html, 'Ads2Trade - Specsheet', 'L');

    }

    public function html2pdf($PDF_html, $PDF_name='Ads2Trade_Document', $PDF_Title='Ads2Trade Dcoument', $PDF_Orientation="L")
    {

        $data = array();
        // create new PDF document

        $pdf = new TCPDF($PDF_Orientation, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $html = $PDF_html;

        //Make sure orientation is valid i.e. either P or L
        if($PDF_Orientation != 'P' && $PDF_Orientation != 'L'){
            $PDF_Orientation = 'L'; //default to landscape if invalid value supplied
        }

        if($PDF_name == '' or  is_null($PDF_name)){
            $PDF_name = 'Ads2Trade_Document'; //default to landscape if invalid value supplied
        }

        // set document information
        //$pdf->SetCreator(PDF_CREATOR);
        $pdf->SetCreator("Ads2Trade");
        $pdf->SetAuthor('Ads2Trade');
        $pdf->SetTitle('Ads2Trade Document Title Goes Here');
        $pdf->SetSubject('Ads2Trade');
        $pdf->SetKeywords('Ads2Trade, PDF, asset, auction, advertising');

        // set default header data
        $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $PDF_Title, PDF_HEADER_STRING);

        // set header and footer fonts
        $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
        $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

        // set auto page breaks
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        // set some language-dependent strings (optional)
        if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
            require_once(dirname(__FILE__).'/lang/eng.php');
            $pdf->setLanguageArray($l);
        }


        // ---------------------------------------------------------

        // set font
        $pdf->SetFont('dejavusans', '', 10);

        // add a page
        $pdf->AddPage();

        // create some HTML content
        if (is_null($html) or ($html == '')) {
                $html = '<!DOCTYPE html>
                <html>
                  <head>
                  <title></title>
                          <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                  </head>
                 <body>
                     <p>ERROR: No Document Data Supplied</p>
                 </body>
                 </html>';

        }

        //$html = $this->load->view('spec_sheet_new', $data, true);

        // output the HTML content
        $pdf->writeHTML($html, true, false, true, false, '');


        // reset pointer to the last page
        $pdf->lastPage();

        // ---------------------------------------------------------

        //Close and output PDF document
        $pdf->Output($PDF_name.'.pdf', 'I');

    }

} //end class