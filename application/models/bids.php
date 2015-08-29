<?php ob_start(); ?>
<?php
class bids extends CI_Model
{

  /*
  Get the max/latest bid for the given auction id
  NOTE: max bid should always be the latest bid
  */
	function getBidDetail($auction_id)
	{
    $query = $this->db->query("SELECT MAX(bid) as currentBid FROM `bids` WHERE auction = '$auction_id'");
    if(empty($query)) {
      return null;
    }
    return $query->result();     
	}

  /*
  This function doesn't make much sense right now?
  See all instances where its used to see if we can change this - bless
  */
	function currentBid($user){
	$query = $this->db->query("SELECT bids.bid as myCurrentBid FROM `bids` 
    WHERE bids.bidder = '$user' ORDER BY bids.id DESC LIMIT 1");
    if(empty($query)) {
      return null;
    }
    return $query->result();
	}

  /*
  Get the latest user/auction bid
  */
  function getUserAuctionBid($user_id, $auction_id){
  $query = $this->db->query("
    SELECT 
      bids.bid as myCurrentBid FROM `bids` 
    WHERE 
      bids.bidder = '$user_id' AND auction='$auction_id' 
    ORDER BY 
      bids.id DESC LIMIT 1");
    if(empty($query)) {
      return null;
    }
    return $query->result();
  }

}