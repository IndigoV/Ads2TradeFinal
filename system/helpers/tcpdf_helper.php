<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// ------------------------------------------------------------------------
/**
 * URL String
 *
 * Creates a PDF document from html text supplied and displays it in the browser window.
 *
 * @access  public
 * @return  not used/not important
 *
 * TODO (blessed): 
 *      Look into giving more options e.g. view in browser, download file, save file onto server etc ????
 *      Keywords for seachabaility (maybe have user pass these as well???)
 */
if (!function_exists('make_pdf'))
{
    function make_pdf($PDF_html, $PDF_name='Ads2Trade_Document', $PDF_Title='Ads2Trade Dcoument', $PDF_Orientation="L")
    {
        $CI =& get_instance();
        $CI->load->library('pdf'); // load library (if not already loaded - CI will handle this check for us though)

        // create new PDF document
        //$pdf = new TCPDF($PDF_Orientation, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf = new Pdf($PDF_Orientation, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $html = $PDF_html;

        //Make sure orientation is valid i.e. either P or L
        if($PDF_Orientation != 'P' && $PDF_Orientation != 'L'){
            $PDF_Orientation = 'L'; //default to landscape if invalid value supplied
        }

        $pdf->setPageOrientation($PDF_Orientation); //custom class seemed to not be picking up orientation in constructor

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

        // output the HTML content
        $pdf->writeHTML($html, true, false, true, false, '');


        // reset pointer to the last page
        $pdf->lastPage();

        // ---------------------------------------------------------

        //Close and output PDF document
        $pdf->Output($PDF_name.'.pdf', 'I');

    }
}

?>