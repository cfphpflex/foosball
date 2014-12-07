
<cfif attributes.save_editor_contents IS "YES">
   <cfset XMLText = #attributes.XMLEditor#>       
   <cffile action="write" file="#storeFolderPath##attributes.xml_filename_vc#" output="#XMLText#">
<cfelse>
   <cfset XMLFileName = #storeFolderPath# & #attributes.xml_filename_vc#>
   <cffile action="read" file="#XMLFileName#" variable="XMLText">
</cfif>

<cfif attributes.overwrite>
<!--- Overwrite mode: remove any records with the same description at first --->
 <cfquery name="delete_xml_file_by_desc" datasource="#request.dsn#">
       DELETE
       FROM
	       	XML_Files
       WHERE
       		description_vc = '#attributes.description_vc#'
  		AND storefront_id_int = #client.admin_storefront_id#
	       	AND archive_bol = 0    			
 </cfquery>
</cfif>

<cfquery name="insert_new_xml_file" datasource="#request.dsn#">
  	SET NOCOUNT ON
  	INSERT INTO XML_Files
  		(              
  		    xml_filename_vc,
                    description_vc,
     		    storefront_id_int, 
     		    create_admin_id_int,
     	            archive_bol 
     	        )
  	VALUES
  		( 
  		    '#attributes.xml_filename_vc#', 
                    '#attributes.description_vc#',
  		    #client.admin_storefront_id#, 
                    #client.admin_id_int#,
  		    0
   	        ) 
  			
  	SELECT NewID = @@IDENTITY
  	SET NOCOUNT OFF
</cfquery>	

