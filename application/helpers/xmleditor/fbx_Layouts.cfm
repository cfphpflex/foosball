<!---
<fusedoc fuse="FBX_Layouts.cfm">
	<responsibilities>
		this file contains all the conditional logic for determining which layout file, if any, should be used for this circuit. It should result in the setting of the Fusebox public API variables fusebox.layoutdir and fusebox.layoutfile 
	</responsibilities>	
	<io>
		<out>
			<string name="fusebox.layoutDir" />
			<string name="fusebox.layoutFile" />
		</out>
	</io>
</fusedoc>
--->


<cfif isDefined("attributes.suppressLayout")>
	<cfset fusebox.layoutdir="">
	<cfset fusebox.layoutfile="">
<cfelse>
	<cfset fusebox.layoutFile = "lay_default.cfm">
	<cfset fusebox.layoutDir = "">
</cfif>