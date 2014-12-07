<!---
<fusedoc fuse="FBX_Settings.cfm">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can use CFSET to override a value set in a parent circuit or CFPARAM to accept a value set by a parent circuit
	</responsibilities>	
</fusedoc>
--->


<!--- In case no fuseaction was given, I'll set up one to use by default. --->
<cfparam name="attributes.fuseaction" default="xmlContentMgmtCategories.home">

<!--- useful constants --->
<cfparam name="request.self" default="index.cfm">

<cfset storeFolderPath = "#base_prod_disk_path#\static\#client.admin_storefront_id#\xml\">

<!--- should fusebox silently suppress its own error messages? default is FALSE --->
<cfset fusebox.suppresserrors = false>

<!--- 
Uncomment this if you wish to have code specific that only executes if the circuit running is the home circuit.
<cfif fusebox.IsHomeCircuit>
	<!--- put settings here that you want to execute only when this is the application's home circuit (for example "<cfapplication>" )--->
<cfelse>
	<!--- put settings here that you want to execute only when this is not an application's home circuit --->
</cfif> 

--->