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
	 
	 
	
	//Validate and Process form data submitted for  upload  
	public function uploadplayerformfilevalidation()
	{   
		// default params 
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
		        
		     	//get file contents
				$file = file_get_contents( $target_file, true);
				//trim headings   	 
		        $file = ltrim($file, "Person,Score,Person,Score");
		        //trim spaces
		        $file = trim($file);	
		        //split to array of strings
		        $fileArray   = preg_split('/\s+/', $file);
		      	//insert records
		      	  
			  	$insertrecords = $this->uploadplayerformfiledatatodb($fileArray); 
			  	
			  	
		       // return "The file ". basename( $_FILES["uploadFile"]["name"]). " has been uploaded.";
		        
		        
		    } else {
		        return "Sorry, there was an error uploading your file.";
		    }
		}
	}

 
 
 
	//insert into db  form data submitted for  upload  
	public function uploadplayerformfiledatatodb($fileArray)
	{    
		// inserts but needs more work to track if inserting or not and how many
		
		//get db connection
		$this->load->model( 'sqlmodel' );  
		//set db connection from controller
		$db 	= $this->sqlmodel->dbconnection();  		//GET DB Connection
		 
		// set sql statement; prevent sql injection using prepare
		$sql = $db->prepare(  " INSERT INTO import  
				( player1, player1Score, player2, player2Score   )  
				values (  ?, ?, ?, ? )  ");   // 1. SQL stmnt 
		 
		for ($i=0; $i<sizeof($fileArray); $i++) {
			//explode string to array
		    $newRecord = explode( ",", $fileArray[$i]);
		    // test for 4  elements
		    if (  sizeof($newRecord == 4) ) {
			    //insert  
				$sql->execute(  array(   $newRecord[0] ,   $newRecord[1] ,   $newRecord[2],  $newRecord[3]   )  );  
			}
			else {  //set counter  0  to report not inserted  
			}  
		  	
		} //END for

		$this->updaterankings();
  
	}//end fn
	
	
	
	
	
	
	//insert into db  form data submitted for  upload  
	public function updaterankings()
	{    
	
		//delete all ranking and recal
		$this-> deleteallranking();
	
		//get db connection
		$this->load->model( 'sqlmodel' );    
		$db 	= $this->sqlmodel->dbconnection();  		//GET DB Connection
	    $sql = $db->prepare(" select distinct(player1) from import union  select distinct(player2) from import  ");  /* 	 //{$sidx}   {$sord} */
		$sql->execute();
		$getUniquePlayerRecords = $sql->fetchAll();
	 	 
		 
		foreach( $getUniquePlayerRecords as $player => $value ) {
		
		
		//var_dump( $value); echo ("<br>");
		
			 
$sql = $db->prepare(" select max(player1score) as score  from import where player1 = '{$value[0]}'    union  select    
			         max(player2score) as score
									 from import   where player2 = '{$value[0]}' order by score DESC  limit 1");  
									 
			$sql->execute();
			$getMaxScore = $sql->fetchAll();	
			
			var_dump($getMaxScore [0] ["score"]);  echo ("<br>");
			 
		  
				 
				// set sql statement; prevent sql injection using prepare
				$sql = $db->prepare(  " INSERT INTO ranking  
						( player, playerScore, playerTotalGames   )  
						values (  ?, ?, ?  )  ");   // 1. SQL stmnt 
				 
			    //insert  
				$sql->execute(  array(   $value[0] ,   $getMaxScore [0] ["score"] , 5  )  );  
		 
		}//end foreach
		 
	 
	} //end funcion
	
	
	
	
	//delete AlL rankings 
	public function deleteallranking()
	{ 
		$this->load->model( 'sqlmodel' );    
		$db 	= $this->sqlmodel->dbconnection();  		//GET DB Connection
	    $sql = $db->prepare(" delete from ranking ");  /* 	 //{$sidx}   {$sord} */
		$sql->execute();
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