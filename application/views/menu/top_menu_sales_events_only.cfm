<cfoutput>
<script language="JavaScript" vqptag="datafile" type="text/javascript">
<!--

<cfset dayofWeek = DayOfWeek(now())>
<cfset thisWeeksFromDate = DateAdd("d", -1 * dayOfWeek, now())>
<cfset thisMonthsFromDate = CreateDate(DatePart("yyyy", now()), DatePart("m", now()), 1)>

function cdd_menu338228(){//////////////////////////Start Menu Data/////////////////////////////////

//**** NavStudio, (c) 2004, OpenCube Inc.,  -  www.opencube.com ****
//Note: This data file may be manually customized outside of the visual interface.

    //Unique Menu Id
	this.uid = 338228


/**********************************************************************************************

                               Icon Images

**********************************************************************************************/

	//Absolute positioned icon images (x,y positioned)

	this.abs_icon_image0 = "medium_blue_right.gif"
	this.abs_icon_rollover0 = ""
	this.abs_icon_image_wh0 = "8,10"
	this.abs_icon_image_xy0 = "-9,6"


/**********************************************************************************************

                              Global - Menu Container Settings

**********************************************************************************************/


	this.menu_background_color = "##dee3e7"
	this.menu_border_color = "##42556b"
	this.menu_border_width = "1"
	this.menu_padding = "1,1,1,1"
	this.menu_border_style = "solid"
	this.divider_caps = false
	this.divider_width = 2
	this.divider_height = 0
	this.divider_background_color = "##dee3e7"
	this.divider_border_style = "none"
	this.divider_border_width = 0
	this.divider_border_color = "##000000"
	this.menu_is_horizontal = false
	this.menu_width = "130"
	this.menu_xy = "-137,-2"


/**********************************************************************************************

                              Global - Menu Item Settings

**********************************************************************************************/


	this.menu_items_background_color_roll = "##ffffff"
	this.menu_items_text_color = "##42556b"
	this.menu_items_text_decoration = "none"
	this.menu_items_font_family = "Arial"
	this.menu_items_font_size = "12px"
	this.menu_items_font_style = "normal"
	this.menu_items_font_weight = "normal"
	this.menu_items_text_align = "left"
	this.menu_items_padding = "4,5,4,5"
	this.menu_items_border_style = "solid"
	this.menu_items_border_color = "##000000"
	this.menu_items_border_width = 0
	this.menu_items_width = 90

	this.menu_items_text_color_roll = "##42556b"
	this.menu_items_background_color = "##dee3e7"




/**********************************************************************************************

                              Main Menu Settings

**********************************************************************************************/


        this.menu_background_color_main = "##8492a5"
        this.menu_items_background_color_main = "##8492a5"
        this.menu_items_background_color_roll_main = "transparent"
        this.menu_items_text_color_main = "##ffffff"
        this.menu_items_text_color_roll_main = "##ffffff"
        this.menu_border_color_main = "##42556b"
        this.menu_items_font_family_main = "Arial"
        this.menu_items_font_family_roll_main = "Arial"
        this.menu_items_font_weight_main = "bold"
        this.menu_items_font_weight_roll_main = "bold"
        this.menu_items_font_style_main = "normal"
        this.menu_items_font_style_roll_main = "normal"
        this.menu_items_font_size_main = "12px"
        this.menu_items_font_size_roll_main = "12px"
        this.menu_items_text_decoration_main = "none"
        this.menu_items_text_decoration_roll_main = "underline"
        this.menu_border_style_main = "solid"
        this.menu_border_width_main = "0"
        this.menu_items_border_width_main = "0"
        this.menu_items_border_color_main = "##42556b"
        this.menu_items_border_color_roll_main = "##42556b"
        this.menu_padding_main = "1,1,1,1"
        this.menu_items_text_align_main = "left"
        this.menu_items_width_main = 118
        this.menu_is_horizontal_main = true
        this.divider_width_main = 0
        this.divider_border_style_main = "dotted"
        this.divider_border_width_main = "1"

        this.item0 = "Sales Events"
        this.icon_rel0 = -1
        this.item_text_color0 = "##ffffff"
        this.item_text_color_roll0 = "##ffffff"
        this.item_text_decoration_roll0 = "underline"
        this.item_width0 = 100

		
        this.url0 = "../index.cfm?fuseaction=events.main"


/**********************************************************************************************

                              Sub Menu Settings

**********************************************************************************************/


    //Sub Menu 0

        this.menu_items_background_color_roll0 = "##ffffff"
        this.menu_xy0 = "-101,1"
        this.menu_width0 = 157

        this.item0_0 = "Add New Sales Event"
        this.url0_0 = "../index.cfm?fuseaction=events.form"
    
}
///////////////////////// END Menu Data /////////////////////////////////////////
//-->
</script>
</cfoutput>