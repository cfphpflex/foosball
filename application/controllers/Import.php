<?php
/**
 * Import class controller for all import actions
 *

 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Import extends CI_Controller {
   
   
   //default import function loads if no other function called
	public function index()
	{   $this->load->model('host'); 
		$this->load->view('navigation.php', $this);	
		$this->load->view('importplayerform.php', $this);	
	}
	 
	 
	 
	//upload submitted form, handoff posted data for processing and load host, navigation first, so we can display correctly  
	public function uploadplayerscorefile()
	{   $this->load->model('host');  					// host env?
		$this->load->view('navigation.php', $this);	 	// Navigation for page
		//var_dump($_FILES);
		
		//validate file	 
		$fileuploadvalidation = $this->uploadplayerformfilevalidation($_FILES);
		//if ($fileuploadvalidation == " ")
		print_r($fileuploadvalidation);
		
	
			
		//$this->uploadplayerformfileuploaded($_FILES);	 // page body
		$this->load->view('getrankingview.php' );	
	}
	 
	 
	
	//Process form data submitted for  upload  
	public function uploadplayerformfilevalidation()
	{   
		$target_dir = "uploads/";
		$target_file = $target_dir . basename($_FILES["uploadFile"]["name"]);
		$uploadOk = 1;
		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		// Check if file already exists


		if (file_exists($target_file)) {
		    return "The file already exists.";
		    $uploadOk = 0;
		}
		// Check file size
		if ($_FILES["uploadFile"]["size"] > 500000) {
		    return "Sorry, your file is too large.";
		    $uploadOk = 0;
		}
		 
		
		//set message for uploaded or not uploaded
		if ($uploadOk == 0) {
		    return "The file was not uploaded.";
		// if everything is ok, try to upload file
		} else {
		    if (move_uploaded_file($_FILES["uploadFile"]["tmp_name"], $target_file)) {
		        
		     
				$file = file_get_contents( $target_file, true);
				
				    	 
		        $file = ltrim($file, "Person,Score,Person,Score");
		        $file = trim($file);	
		        $file   = preg_split('/\s+/', $file);

		        
		        //var_dump($data);	
		        	
				//$file = explode($file);
			 
				//$file2 =  explode(" ", $data);
			 

				
				 

				//$tmp = json_decode(",", $tmp, true);
			 
			 
				
				
				var_dump($file);
		
		
		        return "The file ". basename( $_FILES["uploadFile"]["name"]). " has been uploaded.";
		        
		        
		    } else {
		        return "Sorry, there was an error uploading your file.";
		    }
		}
	}

 
	//Process form data submitted for  upload  
	public function uploadplayerformfileuploaded()
	{   $this->load->model('host'); // host env?
		$this->load->model('importplayerdataformdata.php', $_FILES);	// Navigation for page
	}

 
 
	//GET PLAYER data JSON packet for UI
	public function getplayerdata()
	{   
		$this->load->model('getplayerdata');  //Load the class 
		$this->getplayerdata->getplayerdatabyplayer($_GET['player']);  //JSON response
		 	
	}


	

	//Template
	public function Template()
	{   $this->load->model('host'); 
		$this->load->view('navigation.php', $this);	
		$this->load->view('getrankingview.php', $this);
	}

	 
}



/* End of file welcome.php */
/* Location: ./application/controllers/Welcome.php */