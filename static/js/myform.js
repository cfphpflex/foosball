

	//JQuery DOM  load ready  event listener better than body onload
			$(document).ready(function(){
				
				alert("startof doc ready ");
				//focus on usr input
				//	document.getElementById("#email").focus();
				alert("aferfocusq");
   			 	
   			 	$('#emailid').val('bademail@gm11');
 				
    			alert("afer first email val chanbe");
   			
   			 	$("#email").bind("onchange", JQemailvalid); // sample bind via jquery based on change in form input
   			
   				alert("afer call to function 1");
   			
   			
   			 
  				//if (strlen(trimLeft(trimRight(#email))) > 0)
	  			//	alert('Handler for .change() called.');
				 

				var resetemail = JQemailvalid();
				
   				public function JQemailvalid() {
   					
   					alert("inside JQueryCheckEmail");
   					
   					$('#email').val('invalidE@gm22');

   				    //$("#email").validate();
   					alert("after invalid");
   					
   					return "yes";
   					
   				 }   // JavaScript Closure sample of function w/in function
				 
			     //  alert("resetemail" . resetemail);
			  
			  
			  
			
   					
   					
   					
   					
   					
   					
   					
   					
   					
   				
   		}); // close doc ready func