  <?php         ?>	

<div id="page">	
 
		    <script type="text/javascript">
		      
						
				 $(document).ready(function() 	{   
					// Set U
					var URLGetMaritzProducts 	=  'http://localhost/foosball/index.php/Ranking/getrankingdata';
				 
	    		
		    		//Instanciate Grid 
		            jQuery("#ifwefoosballRanking").jqGrid(   
		             	{  
							url		:		'http://localhost/foosball/index.php/Ranking/getrankingdata', //CFC that will return the users
	        				datatype:   	'json', //We specify that the datatype we will be using will be JSON
	        				// STEP 1   must match the the number of col items 
	        		   		colNames:   	[   'ID','Player', 'Highest Score', 'Total Games'   ], //Column Names
							//The Column Model to define the data. Note you can make columns non sortable, specify width, alignment, etc.
	        				// Requirement: must match colNames and  sql query fields
	        				
	                       // STEP 2> match column headings
		             		colModel: [  

	             			{name:'ranking_ID',index:'ranking_ID'  ,sorttype:"int",editable:false  },
						    
						    {name:'player',index:'player',   sorttype:"text",    
                                    						editable:false,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                            {name:'playerScore',index:'playerScore',   sorttype:"text",
                                    						editable:false,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                                    						 
                            {name:'playerTotalGames',index:'playerTotalGames',   sorttype:"text",
                                    						editable:false,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}} 
                             ],
                             
                             	
						    viewrecords: 	true,
                            gridview: 		true,
                            pager:      	$('#pager'), //The div we have specified, tells jqGrid where to put the pager
            				rowNum:     	3, //Number of records we want to show per page
            				rowifwefoosballRanking:[3,30,40,50], //Row ifwefoosballRanking, to allow user to select how many rows they want to see per page  no values = disabled
            				sortorder:  	"DESC",  //'desc',      //Default sort order
            				sortname:   	"playerScore", //Default sort column
            				viewrecords: 	true, //Shows the nice message on the pager
            				imgpath:        'ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/redmond/', //Image path for prev/next etc images
            				caption:        'FoosBALLER Ranking', //Grid Name
            				recordtext:     "Record {0} - {1} of {2}",//Pager information to show
            				rownumbers:      false,//Show row numbers
            				
            				
							multiselect: false,   // Checkbox to multi selected
							loadonce: true,
							jsonReader: {
								repeatitems: false,
								root: function (obj) { return obj; },
								page: function (obj) { return $("#list").jqGrid('getGridParam', 'page'); },
								total: function (obj) { return Math.ceil(obj.length / $("#list").jqGrid('getGridParam', 'rowNum')); },
								records: function (obj) { return obj.length; }
							},
							




						//SUBGRID
						subGrid: true,
					    subGridRowExpanded: function(subgrid_id, player) {
						   
					       var subgrid_table_id;
					       subgrid_table_id = subgrid_id+"_t";
					       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
					       jQuery("#"+subgrid_table_id).jqGrid({
					          url:			"http://localhost/foosball/index.php/import/getplayerdata?q=2&player="+player,
					          datatype: 	"json",  //'id','groupmember_id',  ,'groupmember_etag_vc'  'group_email_fk_vc',
					          colNames: [ 	'id','player1','score', 'player2', 'score'],
					          colModel: [
					            
					            {name:	"import_ID",  		index:"subgrid_id",width:30},
					            {name:'player1',index:'player1',   width:120, sorttype:"text", editable:true,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}}, 
					           
					            {name:'player1score',index:'player1score',   sorttype:"text",
                                    						editable:true,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}},
                           
					            {name:'player2',index:'player2',   width:120, sorttype:"text", editable:true,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}}, 
					           
					           {name:'player2score',index:'player2score',   sorttype:"text",
                                    						editable:true,edittype:"text",editoptions:{},editrules:{required:true},formoptions:{elmprefix:"(*)"}}
                           
 
					          ],
					          height: '100%',
					          
					        
					          rowNum:  		2000,
					          sortname: 	'player1',
					           
					          sortorder: 	"asc"
					       });
					       },
			              //END SUBGRID
        



								
						
       
        			
        				recordtext:     "Record {0} - {1} of {2}",//Pager information to show
        				rownumbers:      false,//Show row numbers
        				rownumWidth:     "1",//Width of the row numbers column
        				sortable:        true,
        		       	height:          'auto',
                        width:           '720', //I like auto no blank space between. Using a fixed height can mean either a scrollbar or a blank space before the pager
        				mtype:           'POST',
	            			
	            				
	            				//	toolbar:         [true,"top"], //Shows the toolbar at the top. We will use it to display user feedback
	            				
                                    		
            				//ipad, iphone single click works best
            			
            				onSelectRow: 	 function(id){
                                   			 // jQuery('#ifwefoosballRanking').editRow(id); //, true
                                    		 jQuery('#ifwefoosballRanking').jqGrid('editRow',id,true);
                                },
                                    				 
                                    				 
                                    				 
                                    				 
                                    				 	 
            				loadComplete: 	 function(){
                                   			 // jQuery('#ifwefoosballRanking').editRow(id); //, true
                                    			$('#ifwefoosballRanking').jqGrid('setColProp', 'id',
										                                {
									                                      edittype: 'text',
														                  searchoptions: {
														                        			size: '20',
														                        			maxlength: '30'
														                    			  }
										                                }
									                                )
                                },
                                    				 
                                    		 
        
        
            				//The JSON reader. This defines what the JSON data returned from the CFC should look like
            				jsonReader: {                                    					
                        				    root:       "ROWS", //our data
                                            page:       "PAGE", //current page
                                            total:      "TOTAL", //total pages
                                            records:    "RECORDS", //total records
                        					userdata:   "USERDATA", //Userdata we will pass back for feedback
                        					cell:       "", //Not Used
                        					id:         "0" //Will default to first column

            					        },
            			
            				editurl:"http://localhost/foosball/index.php/Ranking//getrankingdata" //The Add/Edit function call	
            				
            				
            				}   //END JDGRID
                          ).navGrid('#pager', {  add: true, del: true, refresh: true, search: false, edit: false } //,
                       );			
                           
                           
                           
                           
                             	
                                    	
                        	
						 //   jQuery("#ifwefoosballRanking").jqGrid('navGrid', '#pager', { add: false, edit: false, del: false },{}, {}, {}, { multipleSearch: true, overlay: false });
						//    jQuery("#ifwefoosballRanking").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, defaultSearch: 'cn' });
						   jQuery("#ifwefoosballRanking").jqGrid('navButtonAdd', '#pager',{ caption: "", title: "Toggle Searching Toolbar",buttonicon: 'ui-icon-pin-s',onClickButton: function () { ifwefoosballRanking[0].toggleToolbar(); }});
									      
								              
						                    //data obj
						                    var columnNames = new Array();
											columnNames[0] = "status";
											 
											 
											//call function
											setSearchSelectcategoryThree_vc(columnNames);
											
											//function 
											function setSearchSelectcategoryThree_vc(columnNames) 
											{
											  		// alert (  columnNames );
						                     		textsLength = columnNames.length;
						                    		//alert ( 'len' + textsLength);
									                 
									                  for (i=0;i<textsLength;i++) {
									                     	columnName = columnNames[i];  									                    									  
										                     		 if (columnName !== undefined ) {
										                     		 								                     		 
															                     		$('#ifwefoosballRanking').jqGrid('setColProp', columnName,
																					                                 {    	 stype: 'select',
																									  						 searchoptions: {  	value:"all:Filter by;active:Active;terminated:Terminated;",
																														 	 					sopt:['eq']
																											          						}
																								  					 }
															                                 			       )
										                     		 								}        
								                           
									                    						   }
								                    
								              	};
								              	
								             //data obj
								             
								         
								         
								    //data obj
						            var columnNames = new Array();         
									columnNames[0] = "status";
									  
											//call function
											setSearchSelectcategoryallothers(columnNames);
											
											//function 
											function setSearchSelectcategoryallothers(columnNames) 
											{
											  		// alert (  columnNames );
						                     		textsLength = columnNames.length;
						                    		//alert ( 'len' + textsLength);
									                 
									                  for (i=0;i<textsLength;i++) {
													                     	         columnName = columnNames[i];  									                    									  
														                     		 if (columnName !== undefined ) {
														                     		 								                     		 
																			                     		                $('#ifwefoosballRanking').jqGrid('setColProp', columnName,
																							                                      {																                                
																							                              		 	edittype: 'text',
																								                  					searchoptions: 
																									                  					{
																									                        				size: '20',
																									                        				maxlength: '30'
																									                    			  	}								     
																							                                       }
																			                                 			       )
														                     		 								}        
												                           
													                    		  }
								                    
								              	};
								              	
								            							
														
										// MASTER control filter toolbar below column names  DO NOT MOVE from here 
										//jQuery("#ifwefoosballRanking").jqGrid('filterToolbar', { autosearch: true, stringResult: true, searchOnEnter: true, groupOp:'AND'});
										
									   $('#ifwefoosballRanking').jqGrid('filterToolbar', { searchOnEnter: false, enableClear: false });
										//jQuery("#ifwefoosballRanking").jqGrid('filterToolbar', {stringResult: true, searchOnEnter: false, defaultSearch:"eq"   });																        
																					
																        
								 	 
                                    	 
                                               
                                                $(function(){
	                                                //  $('#ifwefoosballRanking').jqGrid('navGrid', "#pager", { caption: "", buttonicon: "ui-icon-plusthick", onClickButton: function () { alert('Exporting!!!!!'); }, position: "last", title: "Export to Excel", cursor: "pointer" })
										 			//$('#ifwefoosballRanking').jqGrid('navGrid',"#pager",{edit:false,add:false,del:false,search:true,refresh:false}); //,search:false,refresh:false
                                                });
                                       
				                									 
									setControlToolbarFilter(columnNames);
											//function 
										function setControlToolbarFilter(columnNames) 
										{
																				
																				
														//alert (  columnNames );    //
												          textsLength = columnNames.length;
												          //  alert ( 'len' + textsLength);
						                 				  
						                 				  //START for loop  
						                 				  // INPUT TYPE
						                 				   // values to display and send
						                 				     // operator value in the select drop options
											                  for (i=0;i<textsLength;i++) 
												                  { 
												                    
														           } 
												             // END FOR loop
												            
												             
												           
												          
															
				                   
							              		};
              
			            		//END control toolbar filter
						 
                                              
 
                                        		//Function will be called when add/edit encounters an error. The returned message is what will be shown to user	
                                        		function commonError(data)
                                        	    	{			
                                        		    	return "Error Occured during Operation. Please try again";
                                        	    	}
                                    		
                                    		
                                    			
                                    		}
                                    	);

                                      
                                             //    alert("test3");
        </script>
        
 
	 
    <div id="pager" class="scroll" style="text-align:center;"></div>
    <div id="mysearch"></div>
    <table id="ifwefoosballRanking" class="scroll"  cellpadding="2" cellspacing="2" >
	    
    

</div>
</div>
 

</body>
</html>






