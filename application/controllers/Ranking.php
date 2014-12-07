<?php
/**
 *  view ranking
 *  getrankingdata

 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Ranking extends CI_Controller {
  
	public function index()
	{   $this->load->model('host'); 
		$this->load->view('navigation.php', $this);	
		$this->load->view('getrankingview.php', $this);	
		
		//$this->getrankingdata();
		
	}

	//GET PLAYER RANKING JSON packet for UI
	public function getrankingdata()
	{  // $this->load->model('host');
		$this->load->model('getrankingdata');  //Load the class 
 
		$this->getrankingdata->getrankingByScoreData();  //JSON response
		 	
	}
	    
	 
}



/* End of file welcome.php */
/* Location: ./application/controllers/Welcome.php */



