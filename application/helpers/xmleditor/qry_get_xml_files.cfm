
    	<cfquery name="get_xml_files" datasource="#request.dsn#">
    		SELECT
                        xml_files_id_int,
                        xml_filename_vc,
                        description_vc
    		FROM
    			XML_Files
    		WHERE
    			archive_bol = 0    			
    			AND storefront_id_int = #client.admin_storefront_id#
    		ORDER BY 
    		        description_vc
    	</cfquery>