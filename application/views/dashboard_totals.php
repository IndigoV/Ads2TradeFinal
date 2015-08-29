<?php

//Get Dashboard figures
// 1) Assets
$allAssets = $this->assets->getAllAsset($user_id);
//$data['allAssets'] = $allAssets;
$data['allAssetsCount'] = count($allAssets);
$allAssetsCount = count($allAssets);
$allAssetsValue = 0;
foreach ($allAssets as $row ) {
    # Add Acquisition Cost only if it is > 0
    $allAssetsValue += ($row->ass_acquisition_cost>0)?$row->ass_acquisition_cost:0;
}
$data['allAssetsValue'] = $allAssetsValue;

// 2) Bids
$allBids = $this->auction->allUserBids($user_id);
$data['allBids'] = $allBids;
$data['allBidsCount'] = count($allBids);
$allBidsCount = count($allBids);
$allBidsValue = 0;
foreach ($allBids as $row ) {
    # Add Bid amount if it is > 0
    $allBidsValue += ($row->bid>0)?$row->bid:0;
}
$data['allBidsValue'] = $allBidsValue;

// 3) Auctions

$allAuctions = $this->auction->allUserAuctions($user_id);//var_dump($allAuctions); exit;
$data['allAuctions'] = $allAuctions;
$data['allAuctionsCount'] = count($allAuctions);
$allAuctionsCount = count($allAuctions);
$allAuctionsValue = 0;
foreach ($allAuctions as $row ) {
    # Add Auction amount if it is > 0
    $allAuctionsValue += ($row->bid>0)?$row->bid:0;
}
$data['allAuctionsValue'] = $allAuctionsValue;

// 4) RFP/Campaign Summaries (** Josh **)

$allRFPs = array();//var_dump($allAuctions); exit;
$data['allRFPs'] = $allBids;
$data['allRFPsCount'] = count($allRFPs);
$allRFPsCount = count($allRFPs);
$allRFPsValue = 0;
foreach ($allRFPs as $row ) {
    # Add RFP amount if it is > 0
    $allRFPsValue += ($row->amount>0)?$row->amount:0;
}
$data['allRFPsValue'] = $allRFPsValue;


// 5) Invoices (updaid)

$allInvoices = $this->auction->allUserInvoices($user_id);//var_dump($allAuctions); exit;
$data['allInvoices'] = $allInvoices;
$data['allInvoicesCount'] = count($allInvoices);
$allInvoicesCount = count($allInvoices);
$allInvoicesValue = 0;
foreach ($allInvoices as $row ) {
    # Add Invoice amount if it is > 0
    $allInvoicesValue += ($row->amount>0)?$row->amount:0;
}
$data['allInvoicesValue'] = $allInvoicesValue;

//print_r($data); 
?>