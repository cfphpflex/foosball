
<cfif NOT IsDefined("attributes.overwrite")>

       <cfif IsDefined("attributes.description_vc")>

        	<cfquery name="get_xml_file_by_desc" datasource="#request.dsn#">
        		SELECT
                               xml_files_id_int,
                               xml_filename_vc,
                               description_vc
        		FROM
        			XML_Files
        		WHERE
        			description_vc = '#attributes.description_vc#'
           			AND storefront_id_int = #client.admin_storefront_id#
        			AND archive_bol = 0    			
        	</cfquery>
         
               <cfif get_xml_file_by_desc.recordcount gt 0>
                       <cfset attributes.error_message = attributes.error_message & "<br>XML file with such description already exists.Please, change it.">
               	       <cfset attributes.valid = "no">     
               </cfif>

       </cfif>

   <!--- 
   check whether file exists
   <cfif attributes.valid>   
         <cftry>
                   <cfset xmlFileName = #storeFolderPath# & #attributes.xml_filename_vc#>
                   <cfdump var="#xmlFileName#"><cfabort/> 
	           <cffile action="read" file="#xmlFileName#" variable="attributes.xmlText">
                   <cfset attributes.error_message = attributes.error_message & "<br>XML file with such description already exists.Please, change it.">
               	   <cfset attributes.valid = "no">     
	           <cfcatch type="any">         
  		   </cfcatch>
         </cftry>	
   </cfif> 
   --->

</cfif>

