

/*
 process form values funcgtions */
 


function form_submit(e) {
    
     // Prevent the form from posting
       event.preventDefault(); 
        
    
    //   alert("date---" + moskiform.date_input_id.value  +  " --- "  +  "phone--" + moskiform.phone_input_id.value  +  " --- "   +  "name=" + moskiform.name_input_id.value );       // debug
      
  	
  	// Gather values
      var formValues = $('#moskiform').serialize();
       
   	//   alert("form values" + formValues); // debug
                  
   	  var url = "http://www.exotoolz.com/components/client_MoskiHairLounge.cfc?method=MokiHairAppointment";
     
    //  alert("url values" + url  );
      
      
   // var url = moskiform.action.value;
 
 
 
 
 if (date_input_id.value == "") {
         
        date_input_id.style.background = 'RED';
        alert("Select Date and Time.");

     							   } 
 else {
 
 		date_input_id.style.background = 'GREEN';

 
 }
 
 
 
 
 
    var error = "";
    var stripped =  phone_input_id.value.replace(/[\(\)\.\-\ ]/g, '');
 
   if (phone_input_id.value == "") {
         
        phone_input_id.style.background = 'RED';
        alert("You didn't enter a phone number.");

     							   } 
     							   
   else if (isNaN(parseInt(stripped))) {
         
        phone_input_id.style.background = 'Red';
         alert("The phone number should be 10 numbers.");
 
      									} 
      									
   else if (!(stripped.length == 10)) {
         
        phone_input_id.style.background = 'Red';
         alert("The phone number should be 10 numbers long.");
 
    									}
      
   
  else   {	
  
  
   phone_input_id.style.background = 'Green';
   
   }
   
   
 
  if (name_input_id.value == "") {
         
        name_input_id.style.background = 'RED';
        alert("Type Your Name.");

     							   } 
     							   
 else if  (name_input_id.value.length < 2 ) { 
      
      name_input_id.style.background = 'RED';
        alert("Type a name longer than two letters.");
 
 }
 
 else  {
 
  name_input_id.style.background = 'GREEN';

 
 }
 
     							     

  	
      
 	     // Post to server or post to web storage
  		if(navigator.onLine) 
  			{
   			 console.log("Online");
    		 $.post(url, formValues, function(data) 
    			{
    			 
      				console.log("Success: "+ data);
      				
      				alert(" Sent.  We will call you shortly.");
      				
    			});
  			}
  		else 
   			{
   				console.log("Offline");
    				if(typeof(Storage) !== "undefined") 
      					{
      						console.log("Storage supported");
      						localStorage.formValues = formValues;
      					}
      			alert("Oops, no connection; try when your cell phone is connected.");
    		}
		 
		
	   
	
	
	           
  
         
     }
  
  
  
    



 