<?php
 
 
 
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
 
 class host extends CI_Model {
   
    public function __construct(){
        try{  parent::__construct();
            
            
        }catch(\PDOException $e){
            echo $e->getMessage();
        } //  END try
     
    } //END FUnct
    
	 
	 
	   		
	   
	//Host name

	function myHost(  $debug=0   )
		{ 	if($debug  ===  __FUNCTION__ ) { echo __FUNCTION__ ; var_dump( func_num_args()); }  
	      try {
	         
	           //	public  $protocol = strpos(strtolower($_SERVER['SERVER_PROTOCOL']),'https')=== FALSE ? 'http' : 'https';
		 		 $host     = $_SERVER['HTTP_HOST'];
		 		 $script   = $_SERVER['SCRIPT_NAME'];
		 		 $params   = $_SERVER['QUERY_STRING'];
	        
				$field['protocol'] 	= 	strpos($_SERVER['DOCUMENT_ROOT'], '443') !== false ? 'https://' : 'http://';
				$field['localhost'] = 	$field['protocol'] . $_SERVER['HTTP_HOST'];
				$field['url'] 		=  	$field['protocol']  . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];  
		 
				return $field; 	 
				  
            } catch (Exception $e) {
             	 print_r($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString());
            }  //END catch
	     }	//END    myHost FUNCTiON  
			
		
		
	   
	//Host name

	function loadPost($debug=0   )
		{ 	if($debug  ===  __FUNCTION__ ) { echo __FUNCTION__ ; var_dump( func_num_args()); }  
	
			try {
		          	// use controller to pocess posted  & validate form fields   
			   		if($_POST['submit'])
					    { 
					    	foreach ($_POST as $var => $value)
								{ $field[$var] = $this->input->post($var); //or whatever is the FIELD NAME 
								}
						}
							//print_r($field);
							//$this->load->database();
							//$this->db->insert('admin_user',$field);
					
					foreach ($field as $var => $value)
							{
								//$this->$var =& $value;
								//echo $var . "===" . $value . "<br>";
								//echo $this->input->post($var);
							}
							  
            } catch (Exception $e) {
             	 print_r($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString());
            }  //END catch
            	 	 
	 } //END FUNCTION loadPost   
			
			
	 
	 
	 
	 
	 
}


