<style type="text/css">	<!--
	/* Admin section styles
	added by CAT 1/24/2003 */

	<cfif NOT ( CGI.HTTP_USER_AGENT CONTAINS "msie" )>
		/* use these for netscape since it won't apply styles at TD level */
		BODY, TR, TD {
			font-family:Verdana, Aria, sans-serif;
			color:black;
			font-size: 9pt;
			font-weight : normal;
		}
	</cfif>
	
	.adminBaseFont
	{
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Black;
		background-color: Silver;
	}

	.adminRowA{
		background-color: White;
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Black;
	}
	
	.adminRowA2{
		background-color: Silver;
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Black;
	}

	.adminRowB{
		background-color: White;
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Blue;
	}

	.adminRowC{
		background-color: White;
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Maroon;
	}

	.adminRowD{
		background-color: White;
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Green;
	}

	.adminRowE{
		background-color: White;
		font-family: Verdana, Arial, sans-serif;
		font-size: 9pt;
		color: Purple;
	}

	.adminSectionHeader{
		font-size: 11pt;
		font-weight: bold;
	}

	.adminPageHeader{
		font-size: 12pt;
		color: White;
		font-weight : bold;
		background-color: blue;
	}

	.errorText{
		color: Red;
		font-weight: bold;
		font-size: 11pt;
	}
	
	.smallerText{
		font-size: 8pt;
	}
	
	.smallestText{
		font-size: 6pt;
	}
	
	.adminSeparatorA{
		color: Black;
	}
	.adminSeparatorB{
		color: Blue;
	}
	.adminSeparatorC{
		color: Maroon;
	}
	.adminSeparatorD{
		color: Green;
	}
	.adminSeparatorE{
		color: Purple;
	}
	
	.adminBorderColor{
		bordercolor: 974211;
	}
	
	-->
</style>
