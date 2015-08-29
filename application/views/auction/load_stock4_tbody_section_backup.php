        <?php 

        if(isset($asset) && !empty($asset)):
            if(isset($med) && !empty($med)):
        
        ?>
        <tbody>
            <?php
            $row_id=0; 
            foreach ($asset as $row):
              //requires php 5.3+
              $date1 = new DateTime($row->starts);
              $date2 = new DateTime($row->ends);
              $difference = $date2->diff($date1);
              $diff = $difference->format("%a");

              //TODO: Find out what status id is in auctions table
              $status = 'Available'; 
              //id closed?
              //if($this->assssssetsi->assetReserved($row->ass_id)){
              $disabled = false;
              $action = "Deactivate";
              $create_auction_msg = "Create Auction"; 

              if($row->reserved > 0){
                $status = 'Reserved';
                $disabled = true;
                $action = "Activate";
                $asset_status_detail = $row->ass_status_detail;
                if($asset_status_detail == 1){ // Auction
                  $create_auction_msg = "This Asset is currently on an active Auction";
                } 
                if($asset_status_detail == 2) {
                  $create_auction_msg = "This Asset is currently on an active RFP/Campaign";
                }
                
                $create_auction_msg = "This Asset needs to be activated";
              }
              //id suspended?
              if($row->reserved>0 ){
                //Either:
                // - A bid has been placed
                // - A buy now offer has been made
                // - ITem has been added to an RFP
                // - Item was manuyally marked as "reserved" by the Media owner
                $status = 'Reserved';
              }  

            ?>
            <tr id="<?php echo ++$row_id;?>">  
                <?php $link = site_url('load_stock/view_asset');?>
                <td>
                  <a href="<?php echo $link."?ass_id=$row->ass_id";?>">
                    <?php echo $row->ass_name;?>
                  </a>
                </td>
                <td><?php echo $row->ass_description;?></td>
                <td>
                <?php 
                  foreach ($med as $row1): 
                    if ($row->mec_id == $row1->mec_id): 
                      echo $row1->mec_description; 
                    endif;
                  endforeach;
                ?>
                </td>
                <td>
                <?php
                  $position = $row->position;
                  $url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=$position&sensor=false";
                  // Make the HTTP request
                  $data = file_get_contents($url);
                  // Parse the json response
                  $jsondata = json_decode($data,true);
                  $address = array('formatted_address' => $jsondata["results"][0]["formatted_address"]);
                  echo $address['formatted_address'];
                ?>
                </td>
                <td>
                  <?php 
                    echo ($row->emp_id_maintenance != null && $row->ass_book_value != null)?"Captured": "Partially Captured";
                  ?>
                </td>
                <td><?php echo $row->ass_date;?></td>
                <td align="center" id="<?php echo $row->ass_id; ?>">
                  
                  <a title="<?php echo $create_auction_msg; ?>" style="cursor:pointer" data-toggle="modal" data-target="#addAuctionCart" 
                    data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>"
                    class="<?php echo ($disabled)?'btn-disabled':''; ?>">
                    <span class="h4 glyphicon <?php echo ($disabled)?'glyphicon-lock':'glyphicon-shopping-cart'; ?>"></span>
                  </a>

                  <a title="<?php echo $action;?> Site" style="cursor:pointer" data-toggle="modal" data-target="#siteActivate"
                    data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>"
                    data-modal-action="<?php echo $action;?>">
                  <span class="h4 <?php echo ($disabled)?'glyphicon glyphicon-unchecked':'glyphicon glyphicon-check'; ?>"></span></a>

                  <a href="<?php echo $link."?ass_id=$row->ass_id";?>" 
                    title="Edit Site" style="cursor:pointer">
                    <!-- data-toggle="modal" data-target="#editItemDetails" data-id="<?php echo $row->ass_id; ?>" -->
                    <span class="h4 glyphicon glyphicon-edit"></span>
                  </a>

                  <a title="View PDF Specsheet" style="cursor:pointer" href="<?php echo site_url('load_stock/spec_sheet?ass_id='.$row->ass_id); ?>" target="_blank"><span class="h4 glyphicon glyphicon-book"></span></a>

                  <a href="#" data-id="<?php echo $row->ass_id; ?>" style="cursor:pointer" 
                    data-toggle="modal" data-target="#frmAssetOptions">
                    <span>Marker Popup</span>
                  </a>
                </td>
            </tr>
            <?php endforeach; 
            endif;
            endif;

            ?>
            </tbody>