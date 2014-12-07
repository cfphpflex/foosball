	 
<?php   // TODO: move to class later

		// helps 
		$ci=& get_instance();
 		$ci->load->model("host");  			//Load host environment
  
        //JIRA Credentials from controller Jira 
        // $credentials  	= $this->JiraCredentialsModel->JiraCredentials();
       	$myHost  = $this->host->myHost();
  
?>

 
 

<!DOCTYPE html>
 
 
 <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="<?php echo $myHost['localhost']   ?>/foosball/static/css/foosball.css">
    <link rel="stylesheet" href="<?php echo $myHost['localhost']   ?>/foosball/static/css/bootstrap_min.css">
    <link rel="stylesheet" href="<?php echo $myHost['localhost']   ?>/foosball/static/css/page.css">
     
	<link 	rel	="stylesheet" type="text/css" 		href	=   "<?php echo $myHost['localhost']   ?>/foosball/static/js/jdgrid1/jquery-ui.css" />
	<link 	rel	="stylesheet" type="text/css" 		href	=	"<?php echo $myHost['localhost']   ?>/foosball/static/js/jdgrid1/ui.jqgrid.css" />
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/foosball/static/js/jdgrid1/jquery-ui.min.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/foosball/static/js/jdgrid1/jquery-ui.min.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/foosball/static/js/jdgrid1/grid.locale-en.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/foosball/static/js/jdgrid1/jquery.jqGrid.min.js"></script>
	
	<link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css' />
	<link rel='stylesheet' type='text/css' href='http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css' />
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/jquery-ui-custom.min.js'></script>        
	<script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js'></script>
	<script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/jquery.jqGrid.js'></script>
	 
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="<?php echo $myHost['localhost']   ?>/foosball/static/js/newHire.js"></script>  	
  
    
 
 </head>
   	
 <body>

  
	<!--Top Navigation Starts Here-->
	<div id="topnav"  style="align:left;">
		 
		<div id="topnav-container"   style="align:left;" >
			 
			
			<div id="menu"   style="align:left;"  >
				
				
				<ul id="header-nav"  style="align:left;">
				 	<li class=" ">
 						&nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;   &nbsp;  &nbsp; &nbsp; if(we) Foosball  &nbsp;  &nbsp; &nbsp; 
 						  	 
						    <!--  <a href="##"><img src="http://localhost/foosball/application/views/logo.png"  width="70px"  alt="" title=""  class="logout" />  &nbsp;&nbsp;&nbsp;&nbsp;   </a> -->
							 
					 
					</li>
 
					<li class=" "><a href="<?php echo $myHost['localhost'] ; ?>/foosball/index.php/Ranking/index"  class="logout" ><span>HOME</span></a>
					 			
					</li>
					<li  class=" " ><a  href="<?php echo $myHost['localhost'] ; ?>/foosball/index.php/Import/index"  class="logout" ><span>Import</span></a> 
					</li>
					 
					<li class=" "><a  href="<?php echo $myHost['localhost'] ; ?>/foosball/index.php/Ranking/index"  class="logout" ><span>Rankings</span></a>
					 				
					</li>
					
				  				
						 				  
					<!-- <li class="logout">    <a href="<?php echo $myHost['localhost'] ; ?>/foosball/index.php/Logout/index"   class="logout" >Logout</a> </li> -->
					

					
   
				</ul>
				 
			  
			</div>   <!--  END MENU DIV -->
						
		 
			 
			 
		</div> <!-- END   topnav-container DIV -->	
	</div> <!--   END TOPNAV DIV      -->
	<!--Top Navigation Ends Here-->


	<div class="container">
	 


