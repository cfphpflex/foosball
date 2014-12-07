





 

<!DOCTYPE html>
 
 
 <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/css/bootstrap_min.css">
    <link rel="stylesheet" href="<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/css/page.css">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->





 
<style type="text/css"> 

/* General Styles */

html{

}
body{
	font-family: Arial;
	font-size: 12px;
	width:100%;
	height:100%;
	margin:0;
	padding:0;
}
html, div, span, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, code,
del, dfn, em, img, q, dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
img { margin:0; padding:0; border:0; }

a { cursor:pointer; text-decoration: none; }
a img { border:none; }

.clear { clear:both; }
.float-l{ float:left; }
.float-r{ float:right; }

/* H1 to H6 type Styles */
h1 { font-weight:normal; color:#FFFFFF; font-size:24px; padding:0 0 0 50px; background:url(../images_new/icon_welcome.png) no-repeat left center; line-height:40px; }
h2 { font-weight:normal; color:#381F00; font-size:20px; line-height:60px; }
h3 { font-weight:normal; color:#381F00; font-size:16px; line-height:60px; }
h4 { font-weight:normal; color:#381F00; font-size:12px; line-height:60px; }

/* Linktype Styles */
.linktype1 { color: #FFFFFF; text-decoration: underline; }
.linktype1:hover { text-decoration: none; }
.linktype2 { color: #374838; text-decoration: underline; }
.linktype2:hover { text-decoration: none; }

.required { color:#FF0000; }
/* Header */
#header{
	width: 100%;
	background-color:#729074;
}
#header #head-container{
	width: 1003px;
	height:85px;
	text-align:left;
}
#header #head-container #logo{
	float:left;
	padding:10px 0 0 10px;
	width:500px;
}
#header #head-container #search{
	float:left;
}
#header #head-container #search .enterarea{
	color:#EFF3ED;
	font-weight:bold;
	margin:0;
	float:left;
	padding:0 0 0 5px;
	margin:18px 0 8px 0;
}
#header #head-container #search .enterarea li{
	list-style:none;
	float:left;
}
#header #head-container #search .enterarea li img{
	padding:0 0 0 2px;
	*padding:1px 0 0 2px;
}
#header #head-container #search .enterarea .inputbox{
	padding:2px 0 0 4px;
	margin:0;
	border:1px #4B614C solid;
	background-color:#CDD7CE;
	width:134px;
	height:18px;
}
#header #head-container #search .prod-ord-cust{
	color:#E9F8E4;
	clear:both;
}
#header #head-container #help{
	float:right;
	width:204px;
	height:85px;
	background:url(../images_new/th1_bg-help.gif) no-repeat right bottom;
}
#header #head-container #help p{
	margin:55px 0 0 55px;
	line-height:29px;
}
#header #head-container #help p a{
	color:#EDF1EB;
	font-weight:bold;
	padding:4px 0 4px 25px;
}
#header #head-container #help p a:hover{
	color:#000000;
}
#header #head-container #help p a.help{
	background:url(../images_new/icon_help.png) no-repeat left center;
}
#header #head-container #help p a.logout{
	background:url(../images_new/icon_logout.png) no-repeat left center;
}
#header #head-container #help p span{
	color:#849C85;
	padding:0 5px 0 5px;
	font-size:16px;
}

 /* Top Navigation */
#topnav{
	width: 100%;
	height:38px;
	border-top:1px #B7CBAF solid;
	border-bottom:1px #B7CBAF solid;
	background-color:#98AC90;
}
#topnav #topnav-container{
	width: 1003px;
	height:38px;
	line-height:38px;
	text-align:left;
}
#topnav #topnav-container #menu{
	float:left;
	margin:10px 0 0 0;
}
#topnav #topnav-container #store{
	float:right;
	color:#EFF3ED;
	margin:0 10px 0 0;
}

 /* Top Navigation */
#header-nav{ line-height:normal; height:22px; float:left; clear:both; }
#header-nav, #header-nav ul { padding: 0; margin:0; list-style: none; display:inline; z-index:100000;}
#header-nav li { display:inline; padding:0; line-height:22px; font-weight:bold; }
#header-nav .general { float:left; background:url("../images_new/th1_tab-left.png") no-repeat left top; padding:0 0 0 12px; text-decoration:none; }
#header-nav .general span { float:left; display:block; background:url("../images_new/th1_tab-right.png") no-repeat right top; padding:0 12px 0 0px; color:#F4F7F3; }
/* Commented Backslash Hack hides rule from IE5-Mac \*/
#header-nav .general span { float:none; }
/* End IE5-Mac hack */
#header-nav .general:hover span { color:#FCF6EE; }
#header-nav .general:hover { background-position:0% -22px; }
#header-nav .general:hover span { background-position:100% -22px; }

#header-nav .inpage { float:left; background:url("../images_new/th1_tab-left.png") no-repeat left top; margin:0; padding:0 0 0 12px; text-decoration:none; background-position:0% -22px; }
#header-nav .inpage span { float:left; display:block; background:url("../images_new/th1_tab-right.png") no-repeat right top; padding:0 12px 0 0px; color:#FCF6EE; background-position:100% -22px; }
/* Commented Backslash Hack hides rule from IE5-Mac \*/
#header-nav .inpage span { float:none; }
/* End IE5-Mac hack */
#header-nav .inpage:hover span { color:#FCF6EE; }
#header-nav .inpage:hover { background-position:0% -22px; }
#header-nav .inpage:hover span { background-position:100% -22px; }

#header-nav li ul { /* second-level lists */
	position: absolute;
	margin:0 0 0 -4px;
	background: #CCDAC6;
	left: -999em; /* using left instead of display to hide menus because display: none isn't read by screen readers */
}
#header-nav li ul li{
	line-height:23px;
	font-weight:normal;
	width: 180px;
	clear:both;
}
#header-nav li ul li a{
	color:#162E00;
	padding:0 0 0 10px;
	border-bottom:1px #FFFFFF dotted;
	width: 180px;
	display:block;
}
#header-nav li ul li a:hover{
	color:#FFFFFF;
	background: #729074;
}
#header-nav li ul ul { /* third-and-above-level lists */
	margin: -1em 0 0 6em;
}
#header-nav li:hover ul ul, #header-nav li:hover ul ul ul, #header-nav li.sfhover ul ul, #header-nav li.sfhover ul ul ul {
	left: -999em;
}
#header-nav li:hover ul, #header-nav li li:hover ul, #header-nav li li li:hover ul, #header-nav li.sfhover ul, #header-nav li li.sfhover ul, #header-nav li li li.sfhover ul { /* lists nested under hovered list items */
	left: auto;
}
/* Footer */
#footer{
	width: 100%;
	background-color:#98AC90;
}
#footer #foot-container{
	width: 1003px;
	height:50px;
	text-align:left;
}
#footer #foot-container ul li{
	list-style:none;
	float:left;
	color:#EAF2E7;
	line-height:50px;
}
#footer #foot-container ul li.copyright{
	padding:0 0 0 30px;
	width:800px;
}
#footer #foot-container ul li.powered-logo{
	padding:15px 0 0 10px;
	line-height:normal;
}

/* Container */
#container{
	width: 100%;
	background:url(../images_new/th1_bg-container.gif) repeat-x left top #FEFEFE;
}
#container #page-container{
	width: 1003px;
}

/* Loginpage */
#loginpage{
	width:505px;
	height:313px;
	padding:90px 0 0 90px;
	margin:0 0 70px 0;
	text-align:left;
	background:url(../images_new/th1_bg-loginbox.png) no-repeat left top;
}
#loginpage .inputbox{
	padding:3px 0 0 4px;
	margin:0;
	border:1px #365E16 solid;
	width:278px;
	height:20px;
}

/* Innerpage */
#innerpage{
	width:680px;
	display:table;
	text-align:left;
	padding:0 0 40px 0;
}
#innerpage #cont-disp{
	border:1px #8A9C84 solid;
}
#innerpage #cont-disp .tablehd{
	color:#FFFFFF;
	font-weight:bold;
	font-size:16px;
	padding:0 0 0 15px;
	background-color:#9EAF97;
}

#innerpage #cont-disp .tablehd2{
	color:#FFFFFF;
	line-height:24px;
	font-weight:bold;
	font-size:12px;
	padding:0 0 0 15px;
	background-color:#9EAF97;
}

.tablehd4{
	color:#FFFFFF;
	line-height:14px;
	font-weight:bold;
	font-size:10px;
	padding:0 0 0 8px;
	background-color:#9EAF97;
	text-align:center;
}
.tablehd4 a{
		color:#FFFFFF;
		font-weight:bold;
		text-align:center;
}


#innerpage #cont-disp .rowtype1{
	background-color:#F0F3EF;
}
#innerpage #cont-disp .rowtype2{
	background-color:#D5DED5;
}
#innerpage #cont-disp .textcol{
	text-align:right;
	width:200px;
	padding:0 5px 0 0;
	line-height:30px;
}

#innerpage #cont-disp .textcol2{
	width:120px;
}
#innerpage #cont-disp .textcol3{
	padding:0 0 0 12px;
}
#innerpage #cont-disp .textcol4{
	padding:5px 0 0 0;
}
#innerpage #cont-disp .inputbord{
	border:1px #949D94 solid;
}

#innerpage #cont-disp .textcol5{
	text-align:right;
	width:250px;
	padding:0 5px 0 0;
	line-height:30px;
}

/* Innerpage */
#innerpagetab{
	width:900px;
	display:table;
	text-align:left;
	padding:0 0 40px 0;
}
#innerpagetab #cont-disptab{
	border:1px #8A9C84 solid;
}
#innerpagetab #cont-disptab .tablehd{
	color:#FFFFFF;
	font-weight:bold;
	font-size:16px;
	padding:0 0 0 15px;
	background-color:#9EAF97;
}
#innerpagetab #cont-disptab .tablehd2{
	color:#FFFFFF;
	font-weight:bold;
	font-size:12px;
	padding:0 0 0 15px;
	background-color:#9EAF97;
}

#innerpagetab #cont-disptab .rowtype1{
	background-color:#F0F3EF;
}
#innerpagetab #cont-disptab .rowtype2{
	background-color:#D5DED5;
}
#innerpagetab #cont-disptab .tabcolor{
	background-color:#D5DED5;
}
#innerpagetab #cont-disptab .textcol{
	text-align:right;
	width:140px;
	padding:0 5px 0 0;
	line-height:30px;
}
#innerpagetab #cont-disptab .textcol2{
	width:120px;
}
#innerpagetab #cont-disptab .textcol3{
	padding:0 0 0 12px;
}
#innerpagetab #cont-disptab .textcol4{
	padding:5px 0 0 0;
}
#innerpagetab #cont-disptab .inputbord{
	border:1px #949D94 solid;
}

		.PageBrowser
		{
			font-family : Arial,Verdana,Sans-serif;
			font-size: 8pt;}
		.bordernopad
		{	font-family : Arial,Verdana,Sans-serif;
			font-size: 8pt;
			border: 1px solid #<cfoutput>#attributes.bordernopad_color#</cfoutput>;}
		

		.RowA
		{background:#F0F3EF;
			font-family : Arial,Verdana,Sans-serif;
			font-size: 8pt;}
		.RowB
		{background:#F0F3EF;
			font-family : Arial,Verdana,Sans-serif;
			font-size: 8pt;}

		.RowC
		{background:#F0F3EF;
			font-family : Arial,Verdana,Sans-serif;
			font-size: 8pt;}
		.RowD
		{background:#D5DED5;
			font-family : Arial,Verdana,Sans-serif;
			font-size: 8pt;}
			
			
		.TextLink
		{font-size: 8pt; color: 666666;}
		
		.ColumnHeaders {	
			font-size: 11px;
			font-Family: Arial,Verdana,Sans-serif;
			font-Weight: normal;
			color: #9EAF97;
			text-align : center;
			padding : 3px;
			background-color: #9EAF97;
			border-bottom: 1px solid #999;
			border-left: 1px solid #FFF;
			border-right: 1px solid #999;
			border-top: 1px solid #FFF;
			height: 1em;
			margin: -1px 0 -1px 0;
			padding: 1px 3px 1px 3px;
			text-decoration: none;
			white-space: normal;
		}
		.bordernopad td
		{	font-size: 11px;
			font-Family: Arial,Verdana,Sans-serif;
			font-Weight: normal;
			padding : 3px;
			border-bottom: 1px solid #999;
			border-left: 1px solid #FFF;
			border-right: 1px solid #999;
			border-top: 1px solid #FFF;
			height: 1em;
			margin: -1px 0 -1px 0;
			padding: 1px 3px 1px 3px;
			text-decoration: none;
			white-space: normal;
		}
		.RecordsInput
		{
			font-size: 10px;
			font-family: Arial,Verdana,Sans-serif;
			background-color: #efefef;
			height:20px;
			text-align : center;
			padding:0px;
		}
		.SearchFacility
		{
			font-family : Arial Narrow,Arial,Verdana,Sans-serif;
			font-size: 8pt;
			background: #c0c0c0;
			color: #000000;
			padding:1px;
		}
		.errorText {
			font-family: arial,verdana,helvetica;
			FONT-SIZE: 11px; 
			color: Red;
			font-weight: bold;	
			BACKGROUND-COLOR: FFFFCE;
			padding: 10px;
			border: 1px #858789 solid;
			text-align : left;
		}
	
		.alert {
			FONT-SIZE: 11px;
			color : #305A82;
			font-weight : bold;
			BACKGROUND-COLOR: FFFFCE;
			padding: 10px;
			border: 1px #858789 solid;
			width : 100%;
			text-align : left;
		}	
		
		/* Input Buttons */		
button{ 
	position: relative;
	border: 0;
	padding: 0;
	cursor: pointer;
	overflow: visible; /* removes extra side padding in IE */
}
button::-moz-focus-inner{
	border: none;  /* overrides extra padding in Firefox */
}
button span{
	position: relative;
	display: block;
	white-space: nowrap;
}
@media screen and (-webkit-min-device-pixel-ratio:0) {
	/* Safari and Google Chrome only - fix margins */
	button span{
		margin-top: -1px;
	}
}
button.submitBtn1{ 
	padding: 0 15px 0 0;
	font-size:16px;
	font-weight:bold;
	font-family:arial;
	background: transparent url(../images_new/th1_but-type1.png) no-repeat right -39px;
}
button.submitBtn1 span{
	padding: 6px 0 0 15px;
	height:25px;
	color:#ffffff;
	background: transparent url(../images_new/th1_but-type1.png) no-repeat left top;
}
button.submitBtn2{
	padding: 0 20px 0 0;
	font-size:14px;
	font-weight:bold;
	font-family:arial;
	background: transparent url(../images_new/th1_but-type2.png) no-repeat right -27px;
}
button.submitBtn2 span{
	padding: 3px 0 0 21px;
	height:20px;
	color:#ffffff;
	background: transparent url(../images_new/th1_but-type2.png) no-repeat left top;
}
input.submitBtn3{ 
	color:#261807;
	font: bold 12px arial;
	background-color:#FEA93E;
	border:1px solid;
	border-color:#372B1B;
	*margin:1px 0 0 0;
	margin:0 0 0 3px;
	padding:2px 2px 1px 2px;
}
.tablehd3  {
background-color:#B0BFD2;
border-color:#FFFFFF #999999 #999999 #FFFFFF;
border-style:solid;
border-width:1px;
color:#000000;
font-family:verdana,Arial,Helvetica,sans-serif;
font-size:11px;
font-weight:bold;
height:1em;
margin:-1px 0;
padding:3px 6px;
text-align:left;
text-decoration:none;
white-space:normal;

}
/* Navigation */
#tabsF { line-height:normal; font-size:11px; font-weight:bold; margin-left:10px; float:left; width:960px; }
#tabsF ul {	margin:0; padding:0; list-style:none; }
#tabsF li { display:inline; margin:0; padding:0; line-height:22px; }


#tabsF .general3 { float:left; background:url("tabs/tabs1/tableft.gif") no-repeat left top; margin:0; padding:0 0 0 14px; text-decoration:none; }
#tabsF .general3 span { float:left; display:block; background:url("tabs/tabs1/tabright.gif") no-repeat right top; padding:0 23px 0 0; color:#252525; }
/* Commented Backslash Hack hides rule from IE5-Mac \*/
#tabsF .general3 span { float:none; }
/* End IE5-Mac hack */
#tabsF .general3:hover span { color:#FFFFFF; }



#tabsF .inpage2 { float:left; background:url("tabs/tabs1/tableft.gif") no-repeat left top; margin:0; padding:0 0 0 14px; text-decoration:none; background-position:0% -22px; }
#tabsF .inpage2 span { float:left; display:block; background:url("tabs/tabs1/tabright.gif") no-repeat right top; padding:0 23px 0 0px; color:#FFFFFF; background-position:100% -22px; }
/* Commented Backslash Hack hides rule from IE5-Mac \*/
#tabsF .inpage2 span { float:none; }
/* End IE5-Mac hack */
#tabsF .inpage2:hover span { color:#FFFFFF; }

ul.obtabs {
    list-style: none;
    margin: 5px 0 0 10px;
    padding: 0;
    position: absolute;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
	font-weight:bold;
	clear:both;
	float:none;
}

ul.obtabs li.first {
    margin-left: 5px;
}

ul.obtabs li {
    float: left;
    display: block;
    height: 24px;
    padding-right: 12px;
    margin-left: -5px;
    position: relative;
    background: url(images/1tabright-back.gif) 100% 0 no-repeat;
    border-bottom: 1px solid #bbb8a9;
    white-space: nowrap;
}

ul.obtabs span {
    height: 24px;
    line-height: 24px;
    padding-left: 7px;
    background: url(images/1tableft-back.gif) no-repeat;
}

html>body ul.obtabs span {
    display: block;
}

ul.obtabs li#current {
    z-index: 1;
    border-bottom: 1px solid #fff;
    height: 25px;
    background-image: url(images/1tabright.gif);
}

ul.obtabs li#current span {
    background-image: url(images/1tableft.gif);
}

ul.obtabs a {
    color: #252525;
	text-decoration:none;
}

ul.obtabs li#current a{
	color: #fff;
}











 <!--
  /* CoolMenus 4 - default styles - do not edit */
  .clCMEvent{position:absolute; width:99%; height:99%; clip:rect(0,100%,100%,0); left:0; top:0; visibility:visible}
  .clCMAbs{position:absolute; visibility:hidden; left:0; top:0}
  /* CoolMenus 4 - default styles - end */

  /*Style for the background-bar*/
  .clBar{position:absolute; width:10; height:10; background-color:#0351a9; layer-background-color:#0351a9; visibility:hidden}

  /*Styles for level 0*/
  .clLevel0,.clLevel0over{
  	position:absolute;
  	padding:2px;
  	font-family:tahoma,arial,helvetica;
  	font-size:10px;
  	font-weight:bold;
  	/*border: 1px solid black;*/
  }
  .clLevel0{background-color:#0351a9; layer-background-color:#0351a9; color:white;}
  .clLevel0over{background-color:#1640da; layer-background-color:#1640da; color:Yellow; cursor:pointer; cursor:hand; }
  .clLevel0border{position:absolute; visibility:visible; background-color:#c0c0c0; layer-background-color:#1640da}

  /*Styles for level 1*/
  .clLevel1, .clLevel1over {position:absolute; padding:2px; font-family:tahoma, arial,helvetica; font-size:12px; font-weight:bold;}
  .clLevel1{background-color:#FFFFFF; layer-background-color:#FFFFFF; color:#666666;}
  .clLevel1over{background-color:#EFEFEF; layer-background-color:#EFEFEF; color:#000000; cursor:pointer; cursor:hand; }
  .clLevel1border{position:absolute; z-index:500; visibility:hidden; background-color:#999999; layer-background-color:#999999}

  /*Styles for level 2*/
  .clLevel2, .clLevel2over{position:absolute; padding:2px; font-family:tahoma,arial,helvetica; font-size:12px; font-weight:bold}
  .clLevel2{background-color:#FFFFFF; layer-background-color:#FFFFFF; color:#999999;}
  .clLevel2over{background-color:#EFEFEF; layer-background-color:#EFEFEF; color:666666; cursor:pointer; cursor:hand; }
  .clLevel2border{position:absolute; visibility:hidden; background-color:#999999; layer-background-color:#999999}


.contentBorderOuter {
		padding: 0px;
		/* background: transparent; */
      	border-top: 1px solid #DDD;
      	border-right: 1px solid #424242;
      	border-bottom: 1px solid #424242;
	  	border-left: 1px solid #848284;
		background-color: #FFF;  
		/* width:100%;*/
	}

.contentBorderInner {
		padding: 0px;
		/* background: transparent; */
      	border-top:  1px solid #848284;
		border-right: 1px solid #848284;
      	border-bottom: 1px solid #848284;
	  	border-left: 1px solid #DDD;
		/* width:100%;*/
	}	
  -->
</style>

	



<style type="text/css">  <!--
  /* CoolMenus 4 - default styles - do not edit */
  .clCMEvent{position:absolute; width:99%; height:99%; clip:rect(0,100%,100%,0); left:0; top:0; visibility:visible}
  .clCMAbs{position:absolute; visibility:hidden; left:0; top:0}
  /* CoolMenus 4 - default styles - end */

  /*Style for the background-bar*/
  .clBar{position:absolute; width:10; height:10; background-color:#0351a9; layer-background-color:#0351a9; visibility:hidden}

  /*Styles for level 0*/
  .clLevel0,.clLevel0over{
  	position:absolute;
  	padding:2px;
  	font-family:tahoma,arial,helvetica;
  	font-size:10px;
  	font-weight:bold;
  	/*border: 1px solid black;*/
  }
  .clLevel0{background-color:#0351a9; layer-background-color:#0351a9; color:white;}
  .clLevel0over{background-color:#1640da; layer-background-color:#1640da; color:Yellow; cursor:pointer; cursor:hand; }
  .clLevel0border{position:absolute; visibility:visible; background-color:#c0c0c0; layer-background-color:#1640da}

  /*Styles for level 1*/
  .clLevel1, .clLevel1over {position:absolute; padding:2px; font-family:tahoma, arial,helvetica; font-size:12px; font-weight:bold;}
  .clLevel1{background-color:#FFFFFF; layer-background-color:#FFFFFF; color:#666666;}
  .clLevel1over{background-color:#EFEFEF; layer-background-color:#EFEFEF; color:#000000; cursor:pointer; cursor:hand; }
  .clLevel1border{position:absolute; z-index:500; visibility:hidden; background-color:#999999; layer-background-color:#999999}

  /*Styles for level 2*/
  .clLevel2, .clLevel2over{position:absolute; padding:2px; font-family:tahoma,arial,helvetica; font-size:12px; font-weight:bold}
  .clLevel2{background-color:#FFFFFF; layer-background-color:#FFFFFF; color:#999999;}
  .clLevel2over{background-color:#EFEFEF; layer-background-color:#EFEFEF; color:666666; cursor:pointer; cursor:hand; }
  .clLevel2border{position:absolute; visibility:hidden; background-color:#999999; layer-background-color:#999999}


.contentBorderOuter {
		padding: 0px;
		/* background: transparent; */
      	border-top: 1px solid #DDD;
      	border-right: 1px solid #424242;
      	border-bottom: 1px solid #424242;
	  	border-left: 1px solid #848284;
		background-color: #FFF;  
		/* width:100%;*/
	}

.contentBorderInner {
		padding: 0px;
		/* background: transparent; */
      	border-top:  1px solid #848284;
		border-right: 1px solid #848284;
      	border-bottom: 1px solid #848284;
	  	border-left: 1px solid #DDD;
		/* width:100%;*/
	}	
  -->
</style>
	
	
	
	



	<link 	rel	="stylesheet" type="text/css" 		href	=   "<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/jdgrid1/jquery-ui.css" />
	<link 	rel	="stylesheet" type="text/css" 		href	=	"<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/jdgrid1/ui.jqgrid.css" />
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/jdgrid1/jquery-ui.min.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/jdgrid1/jquery-ui.min.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/jdgrid1/grid.locale-en.js"></script>
	<script type="text/javascript" 					src		=	"<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/jdgrid1/jquery.jqGrid.min.js"></script>
	
	<link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css' />
	<link rel='stylesheet' type='text/css' href='http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css' />
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/jquery-ui-custom.min.js'></script>        
	<script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js'></script>
	<script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/jquery.jqGrid.js'></script>
	 
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="<?php echo $myHost['localhost']   ?>/hr-portal/newportal/static/js/newHire.js"></script>  	
  
    
 </head>
   	
 <body>

	
	 
 <?php   // TODO: move to class later
  
        //JIRA Credentials from controller Jira 
       // $credentials  	= $this->JiraCredentialsModel->JiraCredentials();
       	$myHost  = $this->host->myHost();
       	
  //echo       	application_navpath;  // failed attemp to config path; retry later
 
?>


	
	
	
 
	<!--Top Navigation Starts Here-->
	<div id="topnav"  style="align:left;">
		 
		<div id="topnav-container"   style="align:left;" >
			 
			
			<div id="menu"   style="align:left;"  >
				
				
				<ul id="header-nav">
				 	<li class="general">
 						<div id="logo"  style="vertical-align:top;" >
						     <a href="##"><img src="http://localhost/hr-portal/newportal/application/views/logo.png"  width="70px"  alt="" title="" />  &nbsp;&nbsp;&nbsp;&nbsp;   </a>
							 
						</div>	
					</li>
 
					<li class="general"><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/newhire/index" ><span>HOME</span></a>
					 			
					</li>
					<li class="general"><a href="##"><span>New Hire</span></a>
						
						<ul>
							<li><a  href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/newhire/index">Register</a></li>
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/newhire/view" >Edit </a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.add"></a></li>
							<li><a href="/admin/index.cfm?fuseaction=clientuserlevels.main">Delete </a></li>
						</ul>			
								
					</li>
					 
					<li class="general"><a href="##"><span>Staff</span></a>
						<ul>							
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/changestatus/index" >Status Change</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.add">Add</a></li>
						 </ul>						
					</li>
					
					
					 
					<li class="general"><a     href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/terminate/index"	   ><span>Terminate</span></a>
						<ul>							
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/changestatus/index" >Status Change</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.add">Add</a></li>
						 </ul>						
					</li>
					
					
					<li class="general"><a     href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/gappscontroller/getgroupsview"	   ><span>Groups</span></a>
						<ul>							
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/changestatus/index" >Status Change</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.add">Add</a></li>
						 </ul>						
					</li>
					



					 				
					<li class="general"><a href="##"><span>ADMIN</span></a>
						<ul>
							 
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/managers/index"> Managers </a>
							<li><a href="/admin/index.cfm?fuseaction=wineclub.home"> Departments </a>
							<li><a href="http://localhost/oauth/oauth2-php-google/?service=users"	> Gmail Email Users </a>
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/gappscontroller/getusersview" 	> Gmail Email Users View	 </a>
							<li><a href="http://localhost/oauth/oauth2-php-google/?service=createemailuser"	> create emailuser </a>
							<li><a href="http://localhost/oauth/oauth2-php-google/?service=groups"	> Gmail Groups </a>
							<li><a href="http://localhost/oauth/oauth2-php-google/?service=newgroupmember"  	> Gmail 	New Group	 </a>
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/jira/index" 	> Jira	 </a>
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/jira/searchall"	 	> Jira All	 </a>
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/jira/searchall"	 	> Jira One	 </a>
							<li><a href="<?php echo $myHost['localhost'] ; ?>/hr-portal/newportal/index.php/jira/edit"	  	> Jira Edit	 </a>
							
							
 						</ul>	
					</li>
				 	  
				</ul>
				 
			  
			</div>   <!--  END MENU DIV -->
						
			<div id="help">
				<p><a href="/admin/index.cfm?fuseaction=mainhelp.main" class="help">Help</a> <span>|</span> <a href="#request.self#?fuseaction=login.logout" class="logout">Logout</a></p>
			</div>
			 
		</div> <!-- END   topnav-container DIV -->	
	</div> <!--   END TOPNAV DIV      -->
	<!--Top Navigation Ends Here-->


	<div class="container">
	 

