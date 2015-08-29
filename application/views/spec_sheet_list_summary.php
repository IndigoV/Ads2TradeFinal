
<?php

$this->load->model('assssssetsi','asset');
$this->load->model('assets'); //for geo/maps
$asset_list_ids = $this->input->get('asset_ids');

$data['ast'] = $this->assssssetsi->getAssetList($asset_list_ids);

//asset id
$asset_id = $this->input->get('ass_id');

//main asset details
//$data1['asset_details'] = $this->assets->getAsset();
//$data1['mmm']; //will need to retire this and replace it with a meaningful name
//asset image(s) (if any, else we will show the placeholder picture/thumbnail)
//$data1['asset_images'] = $this->assets->getAssetImages($asset_id);
//asset rate card(s)
//$data1['asset_rates'] = $this->assets->getAssetRateCards($asset_id);

//Asset Images 
  $asset_images = $this->assets->getAssetImages($asset_id);
  //print_r($asset_images[0]->upd_url); 
  //picture url, we need to show these (if any are present, else show placeholder)
  $asset_image_url = $asset_images[0]->upd_url;
  $a_href_class = 'pic'; //default to the placeholder picture
  $a_href_class_css = ''; //No custom css
  if($asset_image_url != ''){
    $a_href_class = 'pic'.$asset_id;
    $a_href_class_css = "
      <style> 
      .assets_box .$a_href_class {
        background-image: url($asset_image_url);
      }
      </style>
    "; //Custom css to use asset picture instead of placeholder
  }
//echo "<pre>";
//print_r($data);exit;

//error_reporting(E_ALL);
    // ob_start();
?>

<style>
table, td, th {
    border: 0px solid black;
}

table {
    width: 100%;
}

</style>


           
 <?php
 $rat_frequency = 0;
 $rate = 0;
 $meu_desc = '';
 $counter = 0;

 if ($data['ast']){ 
    foreach ($data['ast'] as $row) { 
       //asset id
       $asset_id = $row->ass_id;

       $rat_frequency = $row->rat_frequency; 
       $rate = $row->rat_rate; 
       $meu_desc = $row->meu_description;
       
       $asset_status = $row->ass_status;

       //Asset Status
       switch($asset_status){
        case 0: $display_tatus = "Pending Approval";
                break;
        case 1: $display_tatus = "Approved";
                break; 
        case 2:
        case 3: $display_tatus = "Declined/Suspended";
                break;                               
        default:
            $display_tatus = "Pending Approval";
       }

       //Asset Face Count
       //$faces = $this->asset->getAssetFaceCount($asset_id);
       $face_count = 1;
       $restrictions = $row->ass_restrictions;

       //Traffic / footfall figures
       $traffic = "TBA";
       $footfall = "TBA";
       $VAI = "TBA";
       $OTS = "TBA";

       //Exposure
       $disply_exposure = $row->ass_exposure_time.' '.$row->meu_unit;
       $obstruction = $row->obstruction_factor;
       $viewing_angle = $row->viewing_angle;
       $visual_competition = $row->visual_competition;
       $situated_on = $row->ass_street_address;
       /*
       if($situated_on == '' or is_null($situated_on)){
        if($position == '' or is_null($position)){
            $position = $row->latitude.','$row->longitude;
        }
        //$situated_on = $this->assets->Get_Address_From_Google_Maps($position);
        //$situated_on = $situated_on['formatted_address'];
       }
       */
       $illumination = "";

       //Notes
       $notes = "";

       //Production 
       $trim_height = $row->ass_printable_height;
       $trim_width = $row->ass_printable_width;
       if($row->ass_substrate == 1){
        $substrate = "Yes";
       } else {
        $substrate = "None";
       }
       $orientation = $row->ass_orientation;
       $counter++;

       $asset_location = $row->ass_description;
       $pos_between = strpos($asset_location, "Between");
   ?>
  <table style="page-break-before:always:">  
 
        <tbody> 
          <tr>
            <td colspan="3" height="30" valign="center" align="left"> 
              <?php echo $row->ass_ref, ' - ',$row->ass_description; ?>
            </td>
          </tr> 
          <tr> <!-- bgcolor="<?php echo ($counter%2==0)?'red':'green'; ?>" -->  
            <td width="250" height="auto" valign="top">

                <?php 
                if(empty($asset_images)){
                  //Use placeholder picture
                ?>
                  <img src="<?php echo base_url();?>assets/billboard_1.jpg">
                  <img class="thumbnail" height="250px" width="250px" 
                    src="<?php echo base_url();?>assets/add1.jpg">
                <?php
                } else {
                  //Use the first picture found for this asset
                  ?>
                  <img class="thumbnail" height="250px" width="250px" 
                    src="<?php echo $asset_image_url;?>">
                  <?php
                }  
                ?>

            </td>  
            <td valign="top">              
                <img height="auto" width="250" src="<?php echo base_url();?>assets/map.jpg">
            </td>            
            <td width="350" style="vertical-align: top;">
                 <table cellspacing="2" 
                  style="border: 1px;border-color: black; padding-top: 1 ;width: 100%; height: 100%; float: right;border-color: gray;" >
                        <tr><td bgcolor="gray" colspan="2"><font >Rates & Pricing</font></td></tr>
                        <tr><td><strong>Description:</strong> </td><td>R <?php echo $row->ass_description;?></td></tr>
                        <tr><td><strong>Location: </strong></td><td>Hans Schoeman Street</td></tr>
                        <tr><td><strong>Between:  </strong></td><td>M1</td></tr>
                        <tr><td><strong>And:  </strong> </td><td>Hans Strydom Drive</td></tr>
                        <tr><td><strong>Face Side: </strong></td><td>A</td></tr>
                        <tr><td><strong>Road Side: </strong></td><td>Left</td></tr>
                        <tr><td><strong>Grade: </strong></td><td>Premium/Standard</td></tr>
                        <tr>
                        <br>
                          <table width="100%" border="0">
                            <tr>
                              <td colspan="6">SiteID: <?php echo $row->ass_ref;?></td></tr>
                            <tr height="66">
                              <td valign="middle" align="center">
                              <img height="auto" width="50" src="<?php echo base_url();?>assets/images/size_icon.jpg"></td>
                              <td valign="middle" align="center">A0</td>
                              <td><img height="auto" width="50" height="auto" src="<?php echo base_url();?>assets/images/asset_cost_icon.jpg"></td>
                              <td><?php echo $rate;?></td>
                              <td><img height="auto" width="50" height="auto" src="<?php echo base_url();?>assets/images/artwork_cost_icon.jpg"></td>
                              <td><?php echo $row->ass_production_cost_BCY;?></td>
                            </tr>
                          </table>
                          <br>
                        </tr>
                        <br>
                </table> 
                <!--
                <br>
                <table cellspacing="10" style="border: 1px;border-color: black; padding-top: 0 ;width: 100%; height: 100%; float: right;border-color: gray;" >
                        <tr><td bgcolor="gray" colspan="2"> <font>Dimensions(Meters)</font></td></tr>
                        <tr><td><strong>Height </strong></td><td><?php echo $row->ass_printable_height;?></td></tr>
                        <tr><td><strong>Width </strong> </td><td><?php echo $row->ass_printable_width;?></td></tr>
                        <tr><td><strong>SQM  </strong></td><td><?php echo ( $row->ass_printable_height * $row->ass_printable_width );?></td></tr>
                </table> 
                <br>
                <table cellspacing="10" style="border: 1px;border-color: black; padding-top: 0 ;width: 100%; height: 100%; float: right;border-color: gray;" >
                        <tr><td bgcolor="gray" colspan="2"> <font>Creative Advice</font></td></tr>
                        <tr><td><?php echo $row->ass_production_requirements;?></td></tr>
                </table> 
                -->                              
            </td>  
            
          </tr>  
          <!--
          <tr nobr="true">  
             <td>              
                <img height="300" width="500" src="<?php echo base_url();?>assets/map.jpg">
              </td>  
            <td style="vertical-align: top;">
                <table cellspacing="2" style="border: 1px;border-color: black; padding-top: 1 ;width: 100%; height: 100%; float: right;border-color: gray;">
                        <tr><td bgcolor="gray" colspan="2"><font>General</font></td></tr>
                        <tr><td> <strong>Approval Status</strong> </td><td>: <?php echo $display_tatus; ?></td></tr>
                        <tr><td> <strong>Face Count</strong></td><td>:</td></tr>
                        <tr><td> <strong>Restrictions</strong></td><td>:</td></tr>
                </table>
                <br>
                <table cellspacing="2" style="border: 1px;border-color: black; padding-top: 1 ;width: 100%; height: 100%; float: right;border-color: gray;">
                        <tr><td bgcolor="gray" colspan="2"> <font >Traffic & Circulation(Daily)</font></td></tr>
                        <tr><td> <strong>Traffic Count</strong> </td><td>:<?php echo $traffic; ?></td></tr>
                        <tr><td> <strong>FootFall / Pedestrians</strong></td><td>:<?php echo $footfall; ?></td></tr>
                        <tr><td> <strong>Opportunity To See(OTS)</strong></td><td>:<?php echo $OTS; ?></td></tr>
                        <tr><td> <strong>Visibility Adjusted Indices(VAI)</strong></td><td>:<?php echo $VAI; ?></td></tr>                      
                </table> 
                <br>
                <table  cellspacing="2" style="border: 1px;border-color: black; padding-top: 1 ;width: 100%; height: 100%; float: right;border-color: gray;">
                        <tr><td bgcolor="gray" colspan="2"> <font>Evaluation</font></td></tr>
                        <tr><td> <strong>Exposure Time</strong> </td><td>:<?php echo $disply_exposure; ?></td></tr>
                        <tr><td> <strong>Obstruction Factor</strong></td><td>:<?php echo $obstruction; ?></td></tr>
                        <tr><td> <strong>Viewing Angle</strong></td><td>:<?php echo $viewing_angle; ?></td></tr>
                        <tr><td> <strong>Visual Competition</strong></td><td>:<?php echo $visual_competition; ?></td></tr>                      
                        <tr><td> <strong>Situated On</strong></td><td>:<?php echo $situated_on; ?></td></tr>
                        <tr><td> <strong>Illumination</strong></td><td>:<?php echo $illumination; ?></td></tr>
                </table> 
            
            
            </td>  
            
          </tr>  
          <tr nobr="true">  
            <td>
                <table cellspacing="2" style="border: 1px;border-color: black; padding-top: 1 ;width: 100%; height: 100%; float: right;border-color: gray;" >
                        <tr>
                            <td bgcolor="gray" colspan="2"><font>Notes</font></td>
                        </tr>
                        <tr>
                            <td style="text-wrap:normal;"><?php echo $notes; ?></td>
                        </tr>
                </table> 
            </td>  
            <td align="left" height="100%" width="40%" style="vertical-align: top;">

                <table cellspacing="2" style="border: 1px;border-color: black; padding-top: 1 ; float: right;border-color: gray;">         
                        <tr><td  bgcolor="gray" colspan="2"><font>Production Info</font></td></tr>
                        <tr><td> <strong>Trim Height</strong> </td><td><?php echo $trim_height; ?></td></tr>
                        <tr><td> <strong>Trim Width</strong></td><td><?php echo $trim_width; ?></td></tr>
                        <tr><td> <strong>Substrate</strong></td><td><?php echo $substrate; ?></td></tr>
                        <tr><td> <strong>Orientation</strong></td><td><?php echo $orientation; ?></td></tr>                      
                        <tr><td colspan="2"> <strong>Production Notes</strong></td></tr>
                        <tr><td colspan="2" ><?php echo $row->ass_production_requirements; ?> </td></tr>                      
                </table> 
            
            </td>  
           
          </tr>
          -->
                             
        </tbody>  
      </table> 
    <!--
    <br>
    
    <table height ="50" width="100%" cellspacing="2" style="padding-top:100px;border: 1px;border-color: black; padding-top: 1 ; float: right;border-color: gray; page-break-after:always;" >
        <tr>
            <td  bgcolor="gray" > <small> Copyright Ads2trade 2000 - <?php echo date('Y');?>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            www.ads2trade.co.za    </small>
            </td>
        </tr>
    </table>
    --> 
    <?php }}?>

<?php
     //$content = ob_get_clean();
/*
    // convert to PDF
    require_once(dirname(__FILE__).'/html2pdf.class.php');
    try
    {
        $html2pdf = new HTML2PDF('P', 'A4', 'fr');
        $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
        $html2pdf->Output('radius.pdf');
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
*/