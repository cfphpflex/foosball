
<cfif IsDefined("attributes.xml_files_id_int")>

 	<cfquery name="get_xml_file" datasource="#request.dsn#">
 		SELECT
                         xml_files_id_int,
                         xml_filename_vc,
                         description_vc
 		FROM
 			XML_Files
 		WHERE
 			xml_files_id_int = #attributes.xml_files_id_int#
    			AND storefront_id_int = #client.admin_storefront_id#
 			AND archive_bol = 0    			
 	</cfquery>
  
</cfif>

