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
		var_dump($_FILES);
		
			$target_dir = "uploads/";
			$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
			$uploadOk = 1;
			$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
			// Check if image file is a actual image or fake image
			if(isset($_POST["submit"])) {
			    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
			    if($check !== false) {
			        echo "File is an image - " . $check["mime"] . ".";
			        $uploadOk = 1;
			    } else {
			        echo "File is not an image.";
			        $uploadOk = 0;
			    }
			}
			// Check if file already exists
			if (file_exists($target_file)) {
			    echo "Sorry, file already exists.";
			    $uploadOk = 0;
			}
			// Check file size
			if ($_FILES["fileToUpload"]["size"] > 500000) {
			    echo "Sorry, your file is too large.";
			    $uploadOk = 0;
			}
			// Allow certain file formats
						/*
			if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
						&& $imageFileType != "gif" ) {
						    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
						    $uploadOk = 0;
						}
			*/
			// Check if $uploadOk is set to 0 by an error
			var_dump($_FILES["fileToUpload"]["tmp_name"]);
			
			if ($uploadOk == 0) {
			    echo "Sorry, your file was not uploaded.";
			// if everything is ok, try to upload file
			} else {
			    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
			        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
			    } else {
			        echo "Sorry, there was an error uploading your file.";
			    }
			}
			
			
			
			
			

		//$this->uploadplayerformfileuploaded($_FILES);	 // page body
		$this->load->view('getrankingview.php', $this);	
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