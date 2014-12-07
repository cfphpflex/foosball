
<cfoutput>
	
<!--- Maritz Grid menu item: Required by   FORT Re-pricing Cross Reference Table Created: 6/12/2013 intercept Maritz API and overwrite --->
<!--- get ICE storefronts ids --->	 
<cfquery name="qGetICEStorefronts" datasource="#request.dsn#">
             SELECT storefront_id_int
             FROM storefront
             WHERE payment_provider_vc =   'ICE'
</cfquery>
	
<!--- getsfid list --->
<cfset sfICEIDList  =  valuelist(qGetICEStorefronts.storefront_id_int)     >

<script language="JavaScript" vqptag="datafile" type="text/javascript">
<!--

<cfset dayofWeek = DayOfWeek(now())>
<cfset thisWeeksFromDate = DateAdd("d", -1 * dayOfWeek, now())>
<cfset thisMonthsFromDate = CreateDate(DatePart("yyyy", now()), DatePart("m", now()), 1)>
<cfset onHoldDatePeriod = DateAdd("d", -61, now())>

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

        this.item0 = "Orders"
        this.item1 = "Products"
        this.item2 = "Clients"
        this.item3 = "Clubs"
    <cfif Val(request.get_storefront.allow_surcharges_bol)>
            this.item4 = "Discounts&nbsp;/&nbsp;Surcharges"
        <cfelse>
                this.item4 = "Discounts"
        </cfif> 
        this.item5 = "Affiliates"
        this.item6 = "Content"
        this.item7 = "Shipping"
                this.item8 = "Reports"
        this.item9 = "Tools"
        this.item10 = "Set Up"

        this.icon_rel0 = -1
        this.item_text_color0 = "##ffffff"
        this.item_text_color_roll0 = "##ffffff"
        this.item_text_decoration_roll0 = "underline"
        this.item_width0 = 62
        this.item_width1 = 70
        this.icon_rel2 = -1
        this.item_width2 = 59
        this.item_width3 = 50
                
        <cfif Val(request.get_storefront.allow_surcharges_bol)>
            this.icon_rel4 = -1
        this.item_width4 = 150
        <cfelse>
                this.icon_rel4 = -1
        this.item_width4 = 75
        </cfif> 
        this.icon_rel5 = -1
        this.item_width5 = 67
        this.icon_rel6 = -1
        this.item_width6 = 63
        this.icon_rel7 = -1
                this.item_width7 = 70
                this.icon_rel8 = -1
        this.item_width8 = 62
        this.icon_rel9 = -1
        this.item_width9 = 50
        this.icon_rel10 = -1
                this.item_width10 = 73

                

        this.url0 = "../index.cfm?fuseaction=orders.main"
        this.url1 = "../index.cfm?fuseaction=items.home"
        this.url2 = "../index.cfm?fuseaction=clients.main"
        <cfif Val(request.get_storefront.club_enabled_bol)>
            this.url3 = "../index.cfm?fuseaction=wineclub.home"
        <cfelse>
                this.url3 = ""
        </cfif>
        this.url4 = "../index.cfm?fuseaction=giftcerts.main"
        this.url5 = "../index.cfm?fuseaction=affiliates.main"
        this.url6 = ""
        this.url8 = "../index.cfm?fuseaction=order_reports.main"


/**********************************************************************************************

                              Sub Menu Settings

**********************************************************************************************/


    //Sub Menu 0

        this.menu_items_background_color_roll0 = "##ffffff"
        this.menu_items_text_decoration_roll0 = "underline"
        this.menu_xy0 = "-63,1"
        this.menu_width0 = 190

        this.item0_0 = "Recent Orders"
        this.item0_1 = "This Week's Orders"
        this.item0_2 = "This Month's Orders"
        this.item0_3 = "Simple Search"
        this.item0_4 = "Advanced Search"
//        this.item0_5 = "Add Order - Single Recipient"
        this.item0_5 = "Add New Order"
        this.item0_6 = "Orders On Hold"
        this.item0_7 = "Import Orders"

        this.url0_0 = "../index.cfm?fuseaction=orders.today"
        this.url0_1 = "../index.cfm?fuseaction=orders.main&search_criteria=1&from_dt=#DateFormat(thisWeeksFromDate,'mm/dd/yyyy')#"
        this.url0_2 = "../index.cfm?fuseaction=orders.main&search_criteria=1&from_dt=#DateFormat(thisMonthsFromDate,'mm/dd/yyyy')#"
        this.url0_3 = "../index.cfm?fuseaction=orders.main"
        this.url0_4 = "../index.cfm?fuseaction=orders.main&searchmode=advanced"
//        this.url0_5 = "../index.cfm?fuseaction=orders.add"
        this.url0_5 = "../index.cfm?fuseaction=addOrder.main"
        this.url0_6 = "../index.cfm?fuseaction=orders.main&search_criteria=1&from_dt=#DateFormat(onHoldDatePeriod,'mm/dd/yyyy')#&onHold=yes"
        this.url0_7 = "../index.cfm?fuseaction=orders.ordimportForm"

    //Sub Menu 1

        this.menu_items_background_color_roll1 = "##ffffff"
        this.menu_xy1 = "-73,1"
        this.menu_width1 = 174

        <cfset item1_no = 0>
        this.item1_#item1_no# = "Search"
        
		<cfset item1_no = item1_no + 1>
        this.item1_#item1_no# = "Add Standard"
        
		<cfset item1_no = item1_no + 1>
        this.item1_#item1_no# = "Add Combo"
        
		<cfset item1_no = item1_no + 1>
        <cfif client.superuser_bol eq 1>
                this.item1_#item1_no# = "Import Products"
                <cfset item1_no = item1_no + 1>
        </cfif>
         
		this.item1_#item1_no# = "Copy Product(s)"
                
        <cfif client.superuser_bol eq 1> 
  			this.item1_#val(item1_no+1)# = "Create Drop-Ship Product(s)"
			this.item1_#val(item1_no+2)# = "Adjust Retail Prices"           
      		<cfset item1_no = item1_no + 2>
        </cfif>
      	this.item1_#val(item1_no+1)# = "Categories"
        this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=contentMgmtCategories.home"
        
		this.item1_#val(item1_no+2)# = "Find Fulfiller"
        this.url1_#val(item1_no+2)# = "../index.cfm?fuseaction=items.find_fulfiller"
        
		this.item1_#val(item1_no+3)# = "Master Fulfillment List"
        this.url1_#val(item1_no+3)# = "../index.cfm?fuseaction=items.master_fulfillment_form"
       
	    this.item1_#val(item1_no+4)# = "Shipment Eligibility Report"
		this.url1_#val(item1_no+4)# = "../index.cfm?fuseaction=reports.shipment_eligibility_form"
		<cfset item1_no = item1_no + 4>
		
		
 		this.item1_#val(item1_no+1)# = "Product Grid"
     	this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=items.grid"
		<cfset item1_no = item1_no + 1> 
		
		<cfif isDefined(Application.session.storefront_id) and  Application.session.storefront_id  >
		this.item1_#val(item1_no+1)# = "Product Grid"
     	this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=items.grid"
		<cfset item1_no = item1_no + 1> 
		
				
				
				
        this.item1_#val(item1_no+1)# = "Product Attributes"
        this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=attributes.main"
		<cfset item1_no = item1_no + 1> 
		
		this.item1_#val(item1_no+1)# = "Wine Allocations"
        this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=allocations.main"
		
		<cfif ListFindNoCase("34,35,73", request.get_storefront.storefront_id_int) neq 0>
			<cfset item1_no = item1_no + 1> 
			this.item1_#val(item1_no+1)# = "Product Reviews"
        	this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=reviews.main"	
		</cfif>

		<cfif (request.get_storefront.storefront_id_int eq 35) OR (request.get_storefront.storefront_id_int eq 36) OR (request.get_storefront.storefront_id_int eq 73)>
			<cfset item1_no = item1_no + 1> 
			this.item1_#val(item1_no+1)# = "Rank Products by..."
        	this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=items.sort"	
			this.menu_xy1_#val(item1_no+1)# = "1,-24"
            this.menu_width1_#val(item1_no+1)# = 72
			this.icon_abs1_#val(item1_no+1)# = 0
               
			//Rank Products Sub Menu                                      
           		this.menu_items_background_color_roll1_0 = "##ffffff"
        		                                 
				this.item1_#val(item1_no+1)#_0 = "Flavor"
             	this.url1_#val(item1_no+1)#_0 = "../index.cfm?fuseaction=items.sort"
              	
				this.item1_#val(item1_no+1)#_1 = "Popularity"
            	this.url1_#val(item1_no+1)#_1 = "../index.cfm?fuseaction=items.sort&combo=1"
		 </cfif>
		 
        <cfif ListFindNoCase("30,35,73", request.get_storefront.storefront_id_int) neq 0>
			<cfset item1_no = item1_no + 1> 
			this.item1_#val(item1_no+1)# = "Collateral Inserts"
        	this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=items.showInserts"
		</cfif>
			
		this.item_background_color_roll1_0 = "##ffffff"

                <cfset item1_no = 0>
        this.url1_#item1_no# = "../index.cfm?fuseaction=items.home"
                <cfset item1_no = item1_no + 1>
        this.url1_#item1_no# = "../index.cfm?fuseaction=items.form&new=1&task=edit"
                <cfset item1_no = item1_no + 1>
        this.url1_#item1_no# = "../index.cfm?fuseaction=items.form&new=1&task=edit&Type=1"
                <cfset item1_no = item1_no + 1>
        <cfif client.superuser_bol eq 1>
                this.url1_#item1_no# = "../index.cfm?fuseaction=items.importForm"
                <cfset item1_no = item1_no + 1>
        </cfif>
                this.url1_#item1_no# = "../index.cfm?fuseaction=items.copy_page1"
                
        <cfif client.superuser_bol eq 1>
                this.url1_#val(item1_no+1)# = "../index.cfm?fuseaction=items.dropship_page1"
        this.url1_#val(item1_no+2)# = "../index.cfm?fuseaction=items.markup_page1"      
                <cfset item1_no = item1_no + 2> 
        </cfif> 

        
        
               

    //Sub Menu 2

		this.menu_items_background_color_roll2 = "##ffffff"
        this.menu_xy2 = "-60,1"
        this.menu_width2 = 96

        this.item2_0 = "Search"
		this.url2_0 = "../index.cfm?fuseaction=clients.main"
        
        this.item2_1 = "Add"
        this.url2_1 = "../index.cfm?fuseaction=clients.add"
       
	this.item2_2 = "Client Groups"
	this.url2_2 = "../index.cfm?fuseaction=clientuserlevels.main"
        
	this.item2_3 = "Merge Clients"
	this.url2_3 = "../index.cfm?fuseaction=clients.merge"

	this.item2_4 = "Import Clients"
	this.url2_4 = "../index.cfm?fuseaction=clients.importForm"

	<cfif NOT request.liveServer>
	    this.item2_5 = "Surveys"
		this.url2_5 = "../index.cfm?fuseaction=clients.surveys"
	</cfif>

        <cfif Val(request.get_storefront.club_enabled_bol)>
    //Sub Menu 3

        this.menu_items_background_color_roll3 = "##ffffff"
        this.menu_xy3 = "-48,1"
        this.menu_width3 = 93

        this.item3_0 = "Clubs"
                        //submenu                       
                        this.icon_point3_0 = -1
                        this.menu_items_background_color_roll3_0 = "##ffffff"
                        this.menu_xy3_0 = "1,-25"
                        this.menu_width3_0 = "180"
                        this.icon_abs3_0 = 0
                        this.item3_0_0 = "List"
                        this.item3_0_1 = "Add"
                        this.item3_0_2 = "Set Current/Next Shipment"
						this.item3_0_3 = "Card Expiration Notice"
                        
                        this.url3_0_0 = "../index.cfm?fuseaction=wineclub.home"
                        this.url3_0_1 = "../index.cfm?fuseaction=wineclub.form&new=1&task=edit"
                        this.url3_0_2 = "../index.cfm?fuseaction=wineclub.setshipments"
						this.url3_0_3 = "../index.cfm?fuseaction=wineclub.cardexpirationnotice"

        this.item3_1 = "Members"
                        //submenu                       
                        this.icon_point3_1 = -1
                        this.menu_items_background_color_roll3_1 = "##ffffff"
                        this.menu_xy3_1 = "1,-25"
                        this.menu_width3_1 = "70"
                        this.icon_abs3_1 = 0
                        this.item3_1_0 = "Search"
                        this.item3_1_1 = "Add"
                        this.item3_1_2 = "Import"
                        this.item3_1_3 = "Report"
                        this.item3_1_4 = "Upcoming Prepaid Expirations"
                        
                        this.url3_1_0 = "../index.cfm?fuseaction=wineclub_subscriptions.home"
                        this.url3_1_1 = "../index.cfm?fuseaction=wineclub_subscriptions.form&new=1&task=edit"
                        this.url3_1_2 = "../index.cfm?fuseaction=wineclub_subscriptions.import"
                        this.url3_1_3 = "../index.cfm?fuseaction=wineclub_reports.member_report"
                        this.url3_1_4 = "../index.cfm?fuseaction=wineclub_reports.prepaid_expirations_report"
                        
        this.item3_2 = "Shipments"
                        //submenu                       
                        this.icon_point3_2 = -1
                        this.menu_items_background_color_roll3_2 = "##ffffff"
                        this.menu_xy3_2 = "1,-25"
                        this.menu_width3_2 = "70"
                        this.icon_abs3_2 = 0
                        
                        this.item3_2_0 = "List"
                        this.item3_2_1 = "Search"                       
                        this.item3_2_2 = "Add"
                        this.item3_2_3 = "Report"
                        
                        this.url3_2_0 = "../index.cfm?fuseaction=wineclub_shipments.home&search_criteria=1"
                        this.url3_2_1 = "../index.cfm?fuseaction=wineclub_shipments.home"
                        this.url3_2_2 = "../index.cfm?fuseaction=wineclub_shipments.form&new=1&task=edit"
                        this.url3_2_3 = "../index.cfm?fuseaction=wineclub_reports.shipment_report"
        </cfif>


    //Sub Menu 4

                this.menu_items_background_color_roll4 = "##ffffff"
        <cfif Val(request.get_storefront.allow_surcharges_bol)>
            this.menu_xy4 = "-150,1"
        this.menu_width4 = 150
        <cfelse>
                this.menu_xy4 = "-75,1"
        this.menu_width4 = 115
        </cfif> 
                
                

        <cfset item4_no = 0>
        <cfif Val(request.get_storefront.enable_gift_certs_bol)>
            this.item4_#val(item4_no)# = "Gift Certificates"

                         //Sub Menu 4_0

                this.icon_point4_#val(item4_no)# = -1
                this.menu_items_background_color_roll4_#val(item4_no)# = "##ffffff"
                this.menu_xy4_#val(item4_no)# = "1,-25"
                this.menu_width4_#val(item4_no)# = "70"

                this.item4_#val(item4_no)#_0 = "Search"
                this.item4_#val(item4_no)#_1 = "Add"
                this.item4_#val(item4_no)#_2 = "Create Batch"

                this.url4_#val(item4_no)#_0 = "../index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=1"
                this.url4_#val(item4_no)#_1 = "../index.cfm?fuseaction=giftcerts.giftcert_add&amount_mon=0"
                this.url4_#val(item4_no)#_2 = "../index.cfm?fuseaction=giftcerts.giftcert_add_batch"
                        
                        <cfset item4_no = item4_no + 1>
                </cfif>
        
        <cfif Val(request.get_storefront.enable_coupons_bol)>
                this.item4_#val(item4_no)# = "Coupon"


            //Sub Menu 4_1

                this.icon_point4_#val(item4_no)# = -1
                this.menu_items_background_color_roll4_#val(item4_no)# = "##ffffff"
                this.menu_xy4_#val(item4_no)# = "1,-25"
                this.menu_width4_#val(item4_no)# = "70"

                this.item4_#val(item4_no)#_0 = "Search"
                this.item4_#val(item4_no)#_1 = "Add"

                this.url4_#val(item4_no)#_0 = "../index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=0"
                this.url4_#val(item4_no)#_1 = "../index.cfm?fuseaction=giftcerts.coupon_add&amount_mon=0"
                <cfset item4_no = item4_no + 1>
        </cfif>

        <cfif Val(request.get_storefront.enable_non_coupon_discounts_bol)>
        this.item4_#val(item4_no)# = "Non-Coupons"

            //Sub Menu 4_2
                this.icon_point4_#val(item4_no)# = -1
                this.menu_items_background_color_roll4_#val(item4_no)# = "##ffffff"
                this.menu_xy4_#val(item4_no)# = "1,-24"
                this.menu_width4_#val(item4_no)# = "70"

                this.item4_#val(item4_no)#_0 = "Search"
                this.item4_#val(item4_no)#_1 = "Add"

                this.url4_#val(item4_no)#_0 = "../index.cfm?fuseaction=giftcerts.discount_search"
                this.url4_#val(item4_no)#_1 = "../index.cfm?fuseaction=giftcerts.discount_add"
                <cfset item4_no = item4_no + 1>
        </cfif>
        
        this.item4_#val(item4_no)# = "Club Discounts"
                    //Sub Menu 4_3
                this.icon_point4_#val(item4_no)# = -1
                this.menu_items_background_color_roll4_#val(item4_no)# = "##ffffff"
                this.menu_xy4_#val(item4_no)# = "1,-24"
                this.menu_width4_#val(item4_no)# = "70"

                this.item4_#val(item4_no)#_0 = "Search"
                this.item4_#val(item4_no)#_1 = "Add"

                this.url4_#val(item4_no)#_0 = "../index.cfm?fuseaction=giftcerts.discount_search&wineclub_bol=1"
                this.url4_#val(item4_no)#_1 = "../index.cfm?fuseaction=giftcerts.discount_add&wineclub_bol=1"
        <cfset item4_no = item4_no + 1>
                                
        <cfif Val(request.get_storefront.allow_surcharges_bol)>
        this.item4_#val(item4_no)# = "Surcharges"
        </cfif>
        
        
        <cfset item4_no = 0>
        <cfif Val(request.get_storefront.enable_gift_certs_bol)>
        this.icon_abs4_#val(item4_no)# = 0
                <cfset item4_no = item4_no + 1>
        </cfif> 
    <cfif Val(request.get_storefront.enable_coupons_bol)>
        this.icon_abs4_#val(item4_no)# = 0
                <cfset item4_no = item4_no + 1>
        </cfif> 
        <cfif Val(request.get_storefront.enable_non_coupon_discounts_bol)>
            this.icon_abs4_#val(item4_no)# = 0
        </cfif>
        <cfset item4_no = item4_no + 1>
        this.icon_abs4_#val(item4_no)# = 0
        
        <cfset item4_no = 0>
        <cfif Val(request.get_storefront.enable_gift_certs_bol)>
                this.url4_#val(item4_no)# = "../index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=1"
                <cfset item4_no = item4_no + 1>
        </cfif>
        <cfif Val(request.get_storefront.enable_coupons_bol)>
                this.url4_#val(item4_no)# = "../index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=0"
                <cfset item4_no = item4_no + 1>
        </cfif>
        <cfif Val(request.get_storefront.enable_non_coupon_discounts_bol)>
        this.url4_#val(item4_no)# = "../index.cfm?fuseaction=giftcerts.discount_search"
                <cfset item4_no = item4_no + 1>
        </cfif>
        
        this.url4_#val(item4_no)# = "../index.cfm?fuseaction=giftcerts.discount_search&wineclub_bol=1"
        <cfset item4_no = item4_no + 1>
        
        <cfif Val(request.get_storefront.allow_surcharges_bol)>
                this.url4_#val(item4_no)# = "../index.cfm?fuseaction=surcharges.main"
        </cfif>

    //Sub Menu 5

        this.menu_items_background_color_roll5 = "##ffffff"
        this.menu_xy5 = "-71,1"
        this.menu_width5 = 75

        this.item5_0 = "Search"
        this.item5_1 = "Add"
        this.item5_2 = "Report All"

        this.url5_0 = "../index.cfm?fuseaction=affiliates.main"
        this.url5_1 = "../index.cfm?fuseaction=affiliates.add"
        this.url5_2 = "../index.cfm?fuseaction=affiliates.report"


	<cfif (ListFind("5", request.get_storefront.storefront_id_int) eq 0)>
    //Sub Menu 6
                
        this.menu_items_background_color_roll6 = "##ffffff"
        this.menu_xy6 = "-64,1"
        this.menu_width6 = 148

		<cfset item6_no = 0>
		<cfif request.get_storefront.storefront_id_int eq 0>  // don't display at all right now
			this.item6_#val(item6_no)# = "Management"
			this.url6_#val(item6_no)# = "../../index.cfm?editmode=1"
			<cfset item6_no = item6_no + 1>
		</cfif>
		this.item6_#val(item6_no)# = "Homepage Options"
		this.url6_#val(item6_no)# = "../index.cfm?fuseaction=contentMgmtHomepage.home"
        
		this.item6_#val(item6_no+1)# = "Categories"
		this.url6_#val(item6_no+1)# = "../index.cfm?fuseaction=contentMgmtCategories.home"

	</cfif>

        //Sub Menu 7
                this.menu_items_background_color_roll7 = "##ffffff"
        this.menu_items_text_color_roll7 = "##42556b"
        this.menu_xy7 = "-70,1"
        this.menu_width7 = 160
                
                this.item7_0 = "Product Ship Groups"

                <cfset _n = 0>
        
                <cfif client.superuser_bol eq 1>
                        this.item7_#_n + 1# = "Carriers"
                        <cfset _n = _n + 1>
                        this.item7_#_n + 1# = "Carrier Codes"
                        <cfset _n = _n + 1>
                        this.item7_#_n + 1# = "Carrier Service Levels"
                        <cfset _n = _n + 1>
                        this.item7_#_n + 1# = "FORT Service Levels"
                        <cfset _n = _n + 1>
                        this.item7_#_n + 1# = "Fulfiller Carrier Account Numbers"
                        <cfset _n = _n + 1>
                </cfif>
                this.item7_#_n + 1# = "Default Carriers"
                <cfset _n = _n + 1>
                this.item7_#_n + 1# = "Fulfiller Shipping Accounts"
                <cfset _n = _n + 1>

        //Sub Menu 7_0

                        this.menu_xy7_0 = "1,-25"
                this.menu_width7_0 = 54

                this.item7_0_0 = "Search"
                this.item7_0_1 = "Add"

                this.url7_0_0 = "../index.cfm?fuseaction=ship_groups.home"
                this.url7_0_1 = "../index.cfm?fuseaction=ship_groups.formType"
                        
                this.icon_abs7_0 = 0
                this.url7_0 = "../index.cfm?fuseaction=ship_groups.home"
                
                <cfset _n = 0>
        
                <cfif client.superuser_bol eq 1>
                        this.url7_#_n + 1# = "../index.cfm?fuseaction=carriers.home"
                        <cfset _n = _n + 1>
                        this.url7_#_n + 1# = "../index.cfm?fuseaction=carrierCodes.home"
                        <cfset _n = _n + 1>
                        this.url7_#_n + 1# = "../index.cfm?fuseaction=carrierServiceLevels.home"
                        <cfset _n = _n + 1>
                        this.url7_#_n + 1# = "../index.cfm?fuseaction=carrierFortServiceLevels.home"
                        <cfset _n = _n + 1>
                        this.url7_#_n + 1# = "../index.cfm?fuseaction=carrierRetailers.home"
                        <cfset _n = _n + 1>
                </cfif> 
                this.url7_#_n + 1# = "../index.cfm?fuseaction=carrierStateStorefronts.home"
                <cfset _n = _n + 1>
                this.url7_#_n + 1# = "../index.cfm?fuseaction=fulfillerShippingAccounts.home"
                <cfset _n = _n + 1>
        
	this.item7_#_n+1# = 'Shipping State Selection Page'
	this.url7_#_n+1# = '../index.cfm?fuseaction=stateSpecification.home'
        
    //Sub Menu 8 - "Reports"

        this.menu_items_background_color_roll8 = "##ffffff"
        this.menu_xy8 = "-63,1"
        this.menu_width8 = 160
	<cfset menu_counter = 0>

	this.item8_#menu_counter# = "Orders"
	this.menu_xy8_#menu_counter# = "1,-25"
	this.menu_width8_#menu_counter# = 160
	this.icon_abs8_#menu_counter# = 0
	<cfset submenu_counter = 0>

		this.item8_#menu_counter#_#submenu_counter# = "Order Activity"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=order_reports.main"
		<cfset submenu_counter = submenu_counter + 1>

		this.item8_#menu_counter#_#submenu_counter# = "Order History"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.orderactivity_form"
		<cfset submenu_counter = submenu_counter + 1>

		this.item8_#menu_counter#_#submenu_counter# = "Order Invoices"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.state_invoice_form"
		<cfset submenu_counter = submenu_counter + 1>

                this.item8_#menu_counter#_#submenu_counter# = "Daily Sales"
                this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=wineclub_reports.daily_sales_report"
		<cfset submenu_counter = submenu_counter + 1>

		<cfif request.get_storefront.storefront_id_int eq 35   OR (request.get_storefront.storefront_id_int eq 73)>
			this.item8_#menu_counter#_#submenu_counter# = "Sales Report"
                        this.menu_xy8_#menu_counter#_#submenu_counter# = "1,-25"
                        this.menu_width8_#menu_counter#_#submenu_counter# = 150
                        this.icon_abs8_#menu_counter#_#submenu_counter# = 0

                        this.item8_#menu_counter#_#submenu_counter#_0 = "Sales by Item"
                        this.url8_#menu_counter#_#submenu_counter#_0 = "../index.cfm?fuseaction=reports.sales_by_item_form"

                        this.item8_#menu_counter#_#submenu_counter#_1 = "Sales by Linktrack code"
                        this.url8_#menu_counter#_#submenu_counter#_1 = "../index.cfm?fuseaction=reports.sales_by_linktrack_form"

                        this.item8_#menu_counter#_#submenu_counter#_2 = "Sales by Coupon code"
                        this.url8_#menu_counter#_#submenu_counter#_2 = "../index.cfm?fuseaction=reports.sales_by_coupon_form"

			<cfset submenu_counter = submenu_counter + 1>
		</cfif>

	        <cfif NOT request.liveServer>
			this.item8_#menu_counter#_#submenu_counter# = "Sales Summary and Detail Reports"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.sales_summary_and_detail_form"
			<cfset submenu_counter = submenu_counter + 1>

			this.item8_#menu_counter#_#submenu_counter# = "Newsletter Subscriber report"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.newsletter_subscriber_form"
			<cfset submenu_counter = submenu_counter + 1>
        	</cfif>

                this.item8_#menu_counter#_#submenu_counter# = "Wine Club Batch Sales"
       	        this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=wineclub_reports.wine_club_batch_sales_report"

	<cfset menu_counter = menu_counter + 1>


	this.item8_#menu_counter# = "Inventory"
	this.menu_xy8_#menu_counter# = "1,-25"
	this.menu_width8_#menu_counter# = 160
	this.icon_abs8_#menu_counter# = 0
	<cfset submenu_counter = 0>

		this.item8_#menu_counter#_#submenu_counter# = "Depletion Summary"
        	this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.inventory_depletion_report_form"
		<cfset submenu_counter = submenu_counter + 1>

		this.item8_#menu_counter#_#submenu_counter# = "Inventory Report"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.inventory_form"
		<cfset submenu_counter = submenu_counter + 1>

	<cfset menu_counter = menu_counter + 1>


	this.item8_#menu_counter# = "Accounting"
	this.menu_xy8_#menu_counter# = "1,-25"
	this.menu_width8_#menu_counter# = 160
	this.icon_abs8_#menu_counter# = 0
	<cfset submenu_counter = 0>

		<cfif client.superuser_bol eq 1 OR request.get_storefront.can_see_recons_bol>
			this.item8_#menu_counter#_#submenu_counter# = "A/P Reconciliation"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=recons.home"
			<cfset submenu_counter = submenu_counter + 1>
		</cfif>

		<cfif client.superuser_bol eq 1>
			this.item8_#menu_counter#_#submenu_counter# = "A/R Recap"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=recaps.home"
			<cfset submenu_counter = submenu_counter + 1>
		</cfif>         

		<cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
			this.item8_#menu_counter#_#submenu_counter# = "Awards Mileage"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.mileage_form"
			<cfset submenu_counter = submenu_counter + 1>
		</cfif>

		this.item8_#menu_counter#_#submenu_counter# = "Commissions"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.commission_form"
		<cfset submenu_counter = submenu_counter + 1>

		this.item8_#menu_counter#_#submenu_counter# = "Credit Card Report"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.credit_card_form"
		<cfset submenu_counter = submenu_counter + 1>

		this.item8_#menu_counter#_#submenu_counter# = "Gross Receipts"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.gross_receipts_form"
		<cfset submenu_counter = submenu_counter + 1>

		this.item8_#menu_counter#_#submenu_counter# = "Sales Tax"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.sales_tax_form"
		<cfset submenu_counter = submenu_counter + 1>



	<cfset menu_counter = menu_counter + 1>


	this.item8_#menu_counter# = "Statistics"
	this.menu_xy8_#menu_counter# = "1,-25"
	this.menu_width8_#menu_counter# = 160
	this.icon_abs8_#menu_counter# = 0
	<cfset submenu_counter = 0>

	        <cfif Val(request.get_storefront.stat_reporting_bol)>
			this.item8_#menu_counter#_#submenu_counter# = "Cart Activity"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.cart_form"
			<cfset submenu_counter = submenu_counter + 1>

			this.item8_#menu_counter#_#submenu_counter# = "Search Activity"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.search_activity_form"
			<cfset submenu_counter = submenu_counter + 1>
		</cfif>

		this.item8_#menu_counter#_#submenu_counter# = "Statistics Report"
		this.url8_#menu_counter#_#submenu_counter# = "http://67.199.36.166/"
		<cfset submenu_counter = submenu_counter + 1>

	<cfset menu_counter = menu_counter + 1>


	this.item8_#menu_counter# = "Shipping and Fulfillment"
	this.menu_xy8_#menu_counter# = "1,-25"
	this.menu_width8_#menu_counter# = 160
	this.icon_abs8_#menu_counter# = 0
	<cfset submenu_counter = 0>

		this.item8_#menu_counter#_#submenu_counter# = "Fulfillment Report"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.fulfillment_form"
		<cfset submenu_counter = submenu_counter + 1>
        
		this.item8_#menu_counter#_#submenu_counter# = "Product Expiration"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.product_expiration_form"
		<cfset submenu_counter = submenu_counter + 1>
        
		this.item8_#menu_counter#_#submenu_counter# = "Shipment Eligibility"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=reports.shipment_eligibility_form"
		<cfset submenu_counter = submenu_counter + 1>
	<cfset menu_counter = menu_counter + 1>


	<cfif Val(request.get_storefront.club_enabled_bol)>
		this.item8_#menu_counter# = "Wine Clubs"
		this.menu_xy8_#menu_counter# = "1,-25"
		this.menu_width8_#menu_counter# = 160
		this.icon_abs8_#menu_counter# = 0
		<cfset submenu_counter = 0>

			this.item8_#menu_counter#_#submenu_counter# = "Members"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=wineclub_reports.member_report"
			<cfset submenu_counter = submenu_counter + 1>

			this.item8_#menu_counter#_#submenu_counter# = "Shipments"
			this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=wineclub_reports.shipment_report"
			<cfset submenu_counter = submenu_counter + 1>

		<cfset menu_counter = menu_counter + 1>
	</cfif>


	this.item8_#menu_counter# = "Direct States"
	this.menu_xy8_#menu_counter# = "1,-25"
	this.menu_width8_#menu_counter# = 160
	this.icon_abs8_#menu_counter# = 0
	<cfset submenu_counter = 0>

		this.item8_#menu_counter#_#submenu_counter# = "NH Report"
		this.url8_#menu_counter#_#submenu_counter# = "../index.cfm?fuseaction=directReports.nhForm"
		<cfset submenu_counter = submenu_counter + 1>

	<cfset menu_counter = menu_counter + 1>


	this.item8_#menu_counter# = "Customers"
	this.url8_#menu_counter# = "../index.cfm?fuseaction=reports.customer_listing_form"
	<cfset menu_counter = menu_counter + 1>
           
                
    //Sub Menu 9

        this.menu_items_background_color_roll9 = "##ffffff"
        this.menu_xy9 = "-51,1"
        this.menu_width9 = 160
                
                <cfset item9_no = 0>
                this.item9_#item9_no# = "Email Campaign Manager"
            this.url9_#item9_no# = "../eblaster/index.cfm"
                <cfset item9_no = item9_no + 1>
        this.item9_#item9_no# = "Payment Provider"
		<cfif get_storefront.payment_provider_vc IS "Verisign">
					this.url9_#item9_no# = "https://manager.paypal.com"
		<cfelseif get_storefront.payment_provider_vc IS "Paypal">
					this.url9_#item9_no# ="https://manager.paypal.com/" 					
		<cfelseif get_storefront.payment_provider_vc IS "Skipjack">
					this.url9_#item9_no# ="https://secure.skipjack.com/" 
		<cfelseif get_storefront.payment_provider_vc IS "Authorize.net">
					this.url9_#item9_no# ="https://account.authorize.net" 
		<cfelseif get_storefront.payment_provider_vc is "Tranvia">
					this.url9_#item9_no# ="https://www.nobelpay.com/prod/npmu/Login.asp"
		<cfelse>
					this.url9_#item9_no# ="https://account.authorize.net" 				
		</cfif>

                <cfset item9_no = item9_no + 1>
                this.item9_#item9_no# = "WSNET Order Export"
                this.url9_#item9_no# = "../index.cfm?fuseaction=tools.export_wsn"

                <cfset item9_no = item9_no + 1>
                this.item9_#item9_no# = "Warehouse Order Export"
                this.url9_#item9_no# = "../index.cfm?fuseaction=tools.export_warehouse"
				
                <cfset item9_no = item9_no + 1>
        		this.item9_#item9_no# = "Help"
        		this.url9_#item9_no# = "../help/WSN_Admin_Guide.htm"
                this.url_target9_#item9_no# = "_new"
				<!---New menu added for help management according to 3721--->
				<cfif client.superuser_bol eq 1>
					<cfset item9_no = item9_no + 1>
	                this.item9_#item9_no# = "Help Management"
	                this.url9_#item9_no# = "../index.cfm?fuseaction=tools.helpmanagement"
				</cfif>
				
                <cfset item9_no = item9_no + 1>
                this.item9_#item9_no# = "Tutorials and Training"
                this.url9_#item9_no# = "../index.cfm?fuseaction=tools.training"
                <cfset item9_no = item9_no + 1>
                this.item9_#item9_no# = "Google Analytics"
                this.url9_#item9_no# = "../index.cfm?fuseaction=tools.google_analytics"
                <cfset item9_no = item9_no + 1>
                this.item9_#item9_no# = "Central Fulfillment"
                <cfif request.liveServer>
                this.url9_#item9_no# = "http://www.800ship.com/"
                <cfelse>
                this.url9_#item9_no# = "http://dev.800ship.com:8950/"
                </cfif>
                <cfset item9_no = item9_no + 1>
                this.item9_#item9_no# = "Admin Activity Log"
                this.url9_#item9_no# = "../index.cfm?fuseaction=tools.admin_activity_log"
                <cfif client.superuser_bol eq 1111> 
                        <cfset item9_no = item9_no + 1>
                        this.item9_#item9_no# = "A/P Recons and A/R Recaps"
                        this.icon_abs9_#item9_no#_0 = 0
                this.icon_abs9_#item9_no#_1 = 0
                        this.url9_#item9_no#_0 = "../index.cfm?fuseaction=recons.home"
                this.url9_#item9_no#_1 = "../index.cfm?fuseaction=recaps.home"
                this.icon_abs9_#item9_no# = 0
                </cfif>
                <cfif (ListFind("20", request.get_storefront.storefront_id_int) neq 0)>
                        <cfset item9_no = item9_no + 1>
                        this.item9_#item9_no# = "Sales Events"
                        this.url9_#item9_no# = "../index.cfm?fuseaction=events.main"
                </cfif>



    //Sub Menu 10

        this.menu_items_background_color_roll10 = "##ffffff"
        this.menu_items_text_color_roll10 = "##42556b"
        this.menu_xy10 = "-76,1"
        this.menu_width10 = 137

                <cfset i10 = 0>
                this.item10_#i10# = "Change Password"
                this.url10_#i10# = "../index.cfm?fuseaction=tools.changepassword"
                
                <cfset i10 = i10 + 1>
        this.item10_#i10# = "Fulfillers/Suppliers"
                this.url10_#i10# = "../index.cfm?fuseaction=retailers.main&search_criteria=1"
                this.icon_abs10_#i10# = 0
                this.menu_xy10_#i10# = "1,-25"
                this.menu_width10_#i10# = 75
                        
                        //Sub Menu 10_0                 
                        this.item10_#i10#_0 = "View All"
                        this.item10_#i10#_1 = "Add"
                        this.item10_#i10#_2 = "Multi-Eligibility Settings"
                        
                        this.url10_#i10#_0 = "../index.cfm?fuseaction=retailers.main&search_criteria=1"
                        this.url10_#i10#_1 = "../index.cfm?fuseaction=retailers.form&task=edit&new=1"
                        this.url10_#i10#_2 = "../index.cfm?fuseaction=retailers2.multi"
                        

                <cfif client.superuser_bol eq 1>
                        <cfset i10 = i10 + 1>
                        this.item10_#i10# = "Storefronts"
                        this.url10_#i10# = "../index.cfm?fuseaction=storefronts.main"
                        
                        <cfset i10 = i10 + 1>
                this.item10_#i10# = "Admins"
                        this.url10_#i10# = "../index.cfm?fuseaction=admins.main"
                        this.icon_abs10_#i10# = 0
                        this.menu_xy10_#i10# = "1,-24"
                        this.menu_width10_#i10# = 53
                    //admins Sub Menu   
                                this.item10_#i10#_0 = "Search"
                                this.item10_#i10#_1 = "Add"
                                
                                this.url10_#i10#_0 = "../index.cfm?fuseaction=admins.main"
                                this.url10_#i10#_1 = "../index.cfm?fuseaction=admins.add"

                        <cfset i10 = i10 + 1>
                this.item10_#i10# = "Phone Types"
                        this.url10_#i10# = "../index.cfm?fuseaction=phone_types.main"
                        this.icon_abs10_#i10# = 0
                this.menu_xy10_#i10# = "1,-24"
                                this.menu_width10_#i10# = 54    
                                //phonetypes Sub Menu   
                                this.item10_#i10#_0 = "Search"
                                this.item10_#i10#_1 = "Add"
                                
                                this.url10_#i10#_0 = "../index.cfm?fuseaction=phone_types.main"
                                this.url10_#i10#_1 = "../index.cfm?fuseaction=phone_types.add"
                        
                        <cfset i10 = i10 + 1>
                this.item10_#i10# = "Weights"
                        this.url10_#i10# = "../index.cfm?fuseaction=weights.main&search_criteria=1"
                        this.icon_abs10_#i10# = 0
                this.menu_xy10_#i10# = "1,-24"
                        this.menu_width10_#i10# = 52                                
                        
                                //weights Sub Menu                                      
                                this.item10_#i10#_0 = "Search"
                                this.item10_#i10#_1 = "Add"
                                
                                this.url10_#i10#_0 = "../index.cfm?fuseaction=weights.main&search_criteria=1"
                                this.url10_#i10#_1 = "../index.cfm?fuseaction=weights.add"
                                
                </cfif>         <!--- <cfif client.superuser_bol eq 1> --->

                <cfset i10 = i10 + 1>
        this.item10_#i10# = "WSN State Charges"
                this.url10_#i10# = "../index.cfm?fuseaction=wsn.main"
                
                <cfset i10 = i10 + 1>
        this.item10_#i10# = "Compliance Table"
                this.url10_#i10# = "../index.cfm?fuseaction=storefront_state_info.main"
                
                <cfif Val(request.get_storefront.enable_source_codes_bol)>
                
                        <cfset i10 = i10 + 1>
                        this.item10_#i10# = "Source Codes"      
                        this.url10_#i10# = "../index.cfm?fuseaction=source_codes.main"
                        this.icon_abs10_#i10# = 0
                    //Sub Menu  
                                this.menu_xy10_#i10# = "1,-25"
                                this.menu_width10_#i10# = 53
                                
                                this.item10_#i10#_0 = "Search"
                                this.item10_#i10#_1 = "Add"
                                
                                this.url10_#i10#_0 = "../index.cfm?fuseaction=source_codes.main"
                                this.url10_#i10#_1 = "../index.cfm?fuseaction=source_codes.add"
                </cfif>                 <!--- <cfif Val(request.get_storefront.enable_source_codes_bol)> --->

                <cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
                        <cfset i10 = i10 + 1>
                        this.item10_#i10# = "Awards Programs"
                        this.url10_#i10# = "../index.cfm?fuseaction=awards.main"
                        this.icon_abs10_#i10# = 0
                        
                                //Sub Menu 10_11                
                                this.menu_xy10_#i10# = "1,-24"
                                this.menu_width10_#i10# = 62
                                
                                this.item10_#i10#_0 = "View All"
                                this.item10_#i10#_1 = "Add"
                                
                                this.url10_#i10#_0 = "../index.cfm?fuseaction=awards.main"
                                this.url10_#i10#_1 = "../index.cfm?fuseaction=awards.add"
                </cfif>

                <cfset i10 = i10 + 1>
                this.item10_#i10# = "Commissions"
                this.menu_xy10_#i10# = "-210,-15"
                this.menu_width10_#i10# = 100
                this.icon_abs10_#i10# = 0

                        //Sub Menu 10_12 for Commissions
                this.item10_#i10#_0 = "View All"
                        this.url10_#i10#_0 = "../index.cfm?fuseaction=commissions.main"
                this.item10_#i10#_1 = "Add"
                        this.url10_#i10#_1 = "../index.cfm?fuseaction=commissions.add"
                        this.item10_#i10#_2 = "Settings"
                        this.url10_#i10#_2 = "../index.cfm?fuseaction=commissions.settings"
                        
                        this.item10_#i10#_3 = "Misc Charges"
                        this.icon_abs10_#i10#_3 = 0
                                //Sub Menu 10_#i10#_3                           
                                this.menu_xy10_#i10#_3 = "1,-24"
                                this.menu_width10_#i10#_3 = 59                          
                                this.item10_#i10#_3_0 = "View All"
                                this.url10_#i10#_3_0 = "../index.cfm?fuseaction=commissions.miscChargesHome"
                                this.item10_#i10#_3_1 = "Add"
                                this.url10_#i10#_3_1 = "../index.cfm?fuseaction=commissions.miscChargesAdd"
                                

                <cfset i10 = i10 + 1>
                this.item10_#i10# = "A/P Recons"
                this.menu_xy10_#i10# = "-240,-15"
                this.menu_width10_#i10# = 125
                this.icon_abs10_#i10# = 0
                
                        //Sub Menu 10_X_0 Recons
                        this.item10_#i10#_0 = "Fulfillment Rates"
                        this.url10_#i10#_0 = "../index.cfm?fuseaction=fulfillmentrates.home"
                        this.icon_abs10_#i10#_0 = 0
                        
                                this.menu_xy10_#i10#_0 = "-10,-23"
                                this.menu_width10_#i10#_0 = 59
                                
                                this.item10_#i10#_0_0 = "Search"
                                this.item10_#i10#_0_1 = "Add"
                                
                                this.url10_#i10#_0_0 = "../index.cfm?fuseaction=fulfillmentrates.searchForm"
                                this.url10_#i10#_0_1 = "../index.cfm?fuseaction=fulfillmentrates.form&new=1"


                        this.item10_#i10#_1 = "Misc Charges"
                        this.url10_#i10#_1 = "../index.cfm?fuseaction=MiscCharges.home"
                        this.icon_abs10_#i10#_1 = 0


                                //Sub Menu 10_#i10#_1
                                
                                
                                this.item10_#i10#_1_0 = "Search"
                                this.url10_#i10#_1_0 = "../index.cfm?fuseaction=MiscCharges.searchForm"
                this.icon_abs10_#i10#_0 = 0
                                                
                                this.item10_#i10#_1_1 = "Add"
                                this.url10_#i10#_1_1 = "../index.cfm?fuseaction=MiscCharges.form"
                this.icon_abs10_#i10#_1 = 0
                                this.menu_xy10_#i10#_1 = "-10,-23"
                                this.menu_width10_#i10#_1 = 59
                                                
                                this.item10_#i10#_1_2 = "Types"
                                this.url10_#i10#_1_2 = "../index.cfm?fuseaction=MiscChargeTypes.home"
                                this.icon_abs10_#i10#_1_2 = 0

                                        //Sub Menu 10_#i10#_1_2                                 
                                        this.menu_xy10_#i10#_1_2 = "-10,-22"
                                        this.menu_width10_#i10#_1_2 = 59
                                        
                                        this.item10_#i10#_1_2_0 = "Search"
                                        this.item10_#i10#_1_2_1 = "Add"
                                        
                                        this.url10_#i10#_1_2_0 = "../index.cfm?fuseaction=MiscChargeTypes.searchForm"
                                        this.url10_#i10#_1_2_1 = "../index.cfm?fuseaction=MiscChargeTypes.form"
                                        
                <cfif client.superuser_bol eq 1>
                        <cfset i10 = i10 + 1>
                        this.item10_#i10# = "Recaps"
                        this.menu_xy10_#i10# = "-240,-15"
                        this.menu_width10_#i10# = 129
                        this.icon_abs10_#i10# = 0
                            
        
                        this.item10_#i10#_0 = "Recurring Charges"
                                // recurring submenu
                                this.menu_xy10_#i10#_0 = "-10,-23"
                                this.menu_width10_#i10#_0 = 55
                                this.icon_abs10_#i10#_0 = 0
                                this.url10_#i10#_0 = "../index.cfm?fuseaction=recapRecurringCharges.home"
                                
                                this.item10_#i10#_0_0 = "Search"
                                this.item10_#i10#_0_1 = "Add"
                                
                                this.url10_#i10#_0_0 = "../index.cfm?fuseaction=recapRecurringCharges.searchForm"
                                this.url10_#i10#_0_1 = "../index.cfm?fuseaction=recapRecurringCharges.form"
                </cfif>         <!--- <cfif client.superuser_bol eq 1> --->
                
                <cfset i10 = i10 + 1>
                this.item10_#i10# = "Meta Tags Admin"
                this.menu_xy10_#i10# = "-240,-15"
                this.menu_width10_#i10# = 59
                this.url10_#i10# = "../index.cfm?fuseaction=meta.home"
		this.icon_abs10_#i10# = 0

	                this.menu_xy10_#i10# = "1,-24"
                        this.menu_width10_#i10# = 52 

			this.item10_#i10#_0 = "List All"
		        this.url10_#i10#_0 = "../index.cfm?fuseaction=meta.home"

			this.item10_#i10#_1 = "Search"
		        this.url10_#i10#_1 = "../index.cfm?fuseaction=meta.searchForm"

			this.item10_#i10#_2 = "Add"
		        this.url10_#i10#_2 = "../index.cfm?fuseaction=meta.form"

                
                <cfset i10 = i10 + 1>
				<cfif client.superuser_bol eq 1 AND Val(request.get_storefront.validate_HTML_bol)>
					this.item10_#i10# = "URL Extensions"
	                this.url10_#i10# = "../index.cfm?fuseaction=extensions.main"
					this.icon_abs10_#i10# = 0
	                this.menu_xy10_#i10# = "1,-25"
	                this.menu_width10_#i10# = 130
                        
                        //Sub Menu 10_0                 
                        this.item10_#i10#_0 = "View All"
                        this.url10_#i10#_0 = "../index.cfm?fuseaction=extensions.main"
						
						this.item10_#i10#_1 = "Add URL Extension"
                        this.url10_#i10#_1 = "../index.cfm?fuseaction=extensions.add"

						this.item10_#i10#_2 = "Validate All"
						this.url10_#i10#_2 = "../index.cfm?fuseaction=extensions.validateHTML"
						
						this.item10_#i10#_3 = "Validate Invalid Only"
                        this.url10_#i10#_3 = "../index.cfm?fuseaction=extensions.validateHTML&invalid=yes"

				<cfelse>
					this.item10_#i10# = "URL Extensions"
		            this.url10_#i10# = "../index.cfm?fuseaction=extensions.main"
				</cfif>
       
                <cfset i10 = i10 + 1>
                this.item10_#i10# = "Locations"
                this.url10_#i10# = "../index.cfm?fuseaction=locations.main"      

                <cfset i10 = i10 + 1>
                this.item10_#i10# = "Blogs"
                this.url10_#i10# = "../index.cfm?fuseaction=blogs.main"      

			<cfif NOT request.liveServer>
                <cfset i10 = i10 + 1>
                this.item10_#i10# = "Compliance Providers"
                this.url10_#i10# = "../index.cfm?fuseaction=compliance_providers.main"      

                <cfset i10 = i10 + 1>
                this.item10_#i10# = "<nobr>Sync Products with DSC</nobr>"
                this.url10_#i10# = "../index.cfm?fuseaction=compliance_processing.home"

                <cfset i10 = i10 + 1>
                this.item10_#i10# = "Category Templates"
                this.url10_#i10# = "../index.cfm?fuseaction=category_templates.main"      
			</cfif>
}
///////////////////////// END Menu Data /////////////////////////////////////////
//-->
</script>
</cfoutput>