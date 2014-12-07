<?php
/**
 * Default first page to load
 *

 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
  
	public function index()
	{   $this->load->model('host'); 
		$this->load->view('navigation.php', $this);	
		$this->load->view('importPlayerData.php', $this);
	}
	  
	public function login()
	{   $this->load->model('host'); 
		$this->load->view('navigation.php', $this);	
	//	$this->load->view('welcome_message.php', $this');
	}
	 
}



/* End of file welcome.php */
/* Location: ./application/controllers/Welcome.php */