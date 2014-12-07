<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
	<body>
			<!--- <cfmenu attributeCollection="#menu#"> --->
			<cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
				<cfset Varwidth = "99%">
			<cfelse>
				<cfset Varwidth = "90%">
			</cfif>
				<cfmenu name="menu" type="horizontal" fontsize="4" bgcolor="dee3e7" selectedItemColor="ffffff"
				menuStyle="font-weight:bold; font-size:13px; border:medium; font-color:ffffff; border-color:42556b; padding:0,0,0,0; border-style: solid; width:#Varwidth#" 
				childStyle="font-weight:bold; font-style:normal; font-size:9.5pt; font-family:Arial narrow; backgroundcolor:ffffff;">
			
			<!--- sub menu 0--->
				<cfmenuitem name="Orders" display="Orders" href="index.cfm?fuseaction=orders.main" Style="width:80px; font-size:12.5px; font-weight:bold;">
					<cfmenuitem name="Recent_Orders" display="Recent Orders" href="index.cfm?fuseaction=orders.today"/> 
					<cfmenuitem name="This_Week's_Orders" display="This Week's Orders" href="index.cfm?fuseaction=orders.main&search_criteria=1&from_dt=#DateFormat(thisWeeksFromDate,'mm/dd/yyyy')#"/>
					<cfmenuitem name="This_Month's_Orders" display="This Month's Orders" href="index.cfm?fuseaction=orders.main&search_criteria=1&from_dt=#DateFormat(thisMonthsFromDate,'mm/dd/yyyy')#"/>
					<cfmenuitem name="Simple_Search" display="Simple Search" href="index.cfm?fuseaction=orders.main"/> 
					<cfmenuitem name="Advanced_Search" display="Advanced Search" href="index.cfm?fuseaction=orders.main&searchmode=advanced"/>
					<!--- <cfmenuitem name="Add_Order-Single_Recipient" display="Add Order - Single Recipient" href="index.cfm?fuseaction=orders.add"/> --->
					<cfmenuitem name="Add_Order-Multiple_Recipients" display="Add New Order" href="index.cfm?fuseaction=addOrder.main"/> 
					<cfmenuitem name="Orders_On_Hold" display="Orders On Hold" href="index.cfm?fuseaction=orders.main&search_criteria=1&from_dt=#DateFormat(onHoldDatePeriod,'mm/dd/yyyy')#&onHold=yes"/>
					<cfmenuitem name="Import_Orders" display="Import Orders" href="index.cfm?fuseaction=orders.ordimportForm"/>
				</cfmenuitem> 
				
				<!--- sub menu 1--->
				<cfset item1_no = 0>
        		<cfset "item1_#item1_no#" = "Search">
				 <cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.home">
				 
				<cfset item1_no = item1_no + 1>
        		<cfset "item1_#item1_no#" = "Add&nbsp;Standard">
        		 <cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.form&new=1&task=edit">
				 
				<cfset item1_no = item1_no + 1>
       			<cfset "item1_#item1_no#" = "Add&nbsp;Combo">
				<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.form&new=1&task=edit&Type=1">
				
				<cfset item1_no = item1_no + 1>
		        <cfif client.superuser_bol eq 1>
		                <cfset "item1_#item1_no#" = "Import&nbsp;Products">
						<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.importForm">
		                <cfset item1_no = item1_no + 1>
		        </cfif>
         
				<cfset "item1_#item1_no#" = "Copy&nbsp;Product(s)">
                <cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.copy_page1">
				
		        <cfif client.superuser_bol eq 1> 
					<cfset item1_no = item1_no + 1>
		  			<cfset "item1_#item1_no#" = "Create&nbsp;Drop-Ship&nbsp;Product(s)">
					<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.dropship_page1">
					<cfset item1_no = item1_no + 1>
					<cfset "item1_#item1_no#" = "Adjust&nbsp;Retail&nbsp;Prices"> 
					<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.dropship_page1">          
		      		<!--- <cfset item1_no = item1_no + 2> --->
		        </cfif>
				
				<cfset item1_no = item1_no + 1>
		      	<cfset "item1_#item1_no#" = "Categories">
				<cfset "url1_#item1_no#" = "index.cfm?fuseaction=contentMgmtCategories.home">
				
		        <cfset item1_no = item1_no + 1>
				<cfset "item1_#item1_no#" = "Find&nbsp;Fulfiller">
		       <cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.find_fulfiller">
			   
		        <cfset item1_no = item1_no + 1>
				<cfset "item1_#item1_no#" = "Master&nbsp;Fulfillment&nbsp;List">
		       <cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.master_fulfillment_form">
		       
			   <cfset item1_no = item1_no + 1>
			    <cfset "item1_#item1_no#" = "Shipment&nbsp;Eligibility&nbsp;Report">
				<cfset "url1_#item1_no#" = "index.cfm?fuseaction=reports.shipment_eligibility_form">
				
				<cfset "item1_no" = item1_no + 1>
				<cfset "item1_#item1_no#" = "Product&nbsp;Grid">
		     	<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.grid">
		
				<cfset "item1_no" = item1_no + 1> 
		        <cfset "item1_#item1_no#" = "Product&nbsp;Attributes">
		        <cfset "url1_#item1_no#" = "index.cfm?fuseaction=attributes.main">
				
				<cfset "item1_no" = item1_no + 1> 
				<cfset "item1_#item1_no#" = "Wine&nbsp;Allocations">
		   		<cfset "url1_#item1_no#" = "index.cfm?fuseaction=allocations.main">
		
				<cfif ListFindNoCase("34,35,73", request.get_storefront.storefront_id_int) neq 0>
					<cfset item1_no = item1_no + 1> 
					<cfset "item1_#item1_no#" = "Product&nbsp;Reviews">
		        	<cfset "url1_#item1_no#" = "index.cfm?fuseaction=reviews.main">
				</cfif>
		
				<cfif (request.get_storefront.storefront_id_int eq 35) OR (request.get_storefront.storefront_id_int eq 36) OR (request.get_storefront.storefront_id_int eq 73)>
					<cfset item1_no = item1_no + 1> 
					<cfset "item1_#item1_no#" = "Rank&nbsp;Products&nbsp;by...">
		        	<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.sort">
					<cfset "menu_xy1_#item1_no#" = "1,-24">
		           <cfset "menu_width1_#item1_no#" = 72>
					<cfset "icon_abs1_#item1_no#" = 0>
		               
					<!--- Rank Products Sub Menu --->                                      
		           		<cfset menu_items_background_color_roll1_0 = "##ffffff">
		
				 </cfif>
				 
		        <cfif ListFindNoCase("30,35,73", request.get_storefront.storefront_id_int) neq 0>
					<cfset item1_no = item1_no + 1> 
					<cfset "item1_#item1_no#" = "Collateral&nbsp;Inserts">
		        	<cfset "url1_#item1_no#" = "index.cfm?fuseaction=items.showInserts">
				</cfif> 
					
				<cfset item_background_color_roll1_0 = "##cdcdcd">
	
				<cfmenuitem name="Products" display="Products" href="##" Style="width:92px;font-size:12.5px; font-weight:bold;">
					
					 <cfloop from="0" to="#item1_no#" index="i">
					 	<cfset menuname = evaluate("item1_#i#")>
						<cfset menuurl = evaluate("url1_#i#")>
					 	<cfmenuitem name="#menuname#" display="#menuname#" href="#menuurl#"> 
							<cfif findnocase("Rank" , menuname)>
								<cfmenuitem name="Flavor" display="Flavor" href="index.cfm?fuseaction=items.sort"/> 
								<cfmenuitem name="Popularity" display="Popularity" href="index.cfm?fuseaction=items.sort&combo=1"/> 
							</cfif>
						</cfmenuitem>
					 </cfloop>
				</cfmenuitem>
				
				<!--- sub menu 2--->
					<cfset item2_0 = "Client&nbsp;Search">
					<cfset url2_0 = "index.cfm?fuseaction=clients.main">
					 <cfset item2_1 = "Add">
					<cfset url2_1 = "index.cfm?fuseaction=clients.add">
					<cfset item2_2 = "Client&nbsp;Groups">
					<cfset url2_2 = "index.cfm?fuseaction=clientuserlevels.main">
					<cfset item2_3 = "Merge&nbsp;Clients">
					<cfset url2_3 = "index.cfm?fuseaction=clients.merge">
					<cfset item2_4 = "Import&nbsp;Clients">
					<cfset url2_4 = "index.cfm?fuseaction=clients.importForm">
					<cfset itemcnt =4>
					
					<cfif NOT request.liveServer>
						<cfset item2_5 = "Surveys">
						<cfset url2_5 = "../index.cfm?fuseaction=clients.surveys">
						<cfset itemcnt =5>
					</cfif>

				<cfmenuitem name="Clients" display="Clients" href="##"  Style="width:81px;font-size:12.5px; font-weight:bold;">
					
					<cfloop from="0" to="#itemcnt#" index="i">
					 	<cfset menuname2 = evaluate("item2_#i#")>
						<cfset menuurl2 = evaluate("url2_#i#")>
						<cfmenuitem name="#menuname2#" display="#menuname2#" href="#menuurl2#" /> 
					 </cfloop>
				</cfmenuitem>
		
				<!--- sub menu 3--->	
       <cfif Val(request.get_storefront.club_enabled_bol)>
    		<cfmenuitem name="Clubs" display="Clubs" href="##"  Style="width:75px;font-size:12.5px; font-weight:bold;">
					<cfmenuitem name="Clubs&nbsp;Clubs" display="Clubs" href="##">
							<cfmenuitem name="Clubs&nbsp;List" display="List" href="index.cfm?fuseaction=wineclub.home" /> 
							<cfmenuitem name="Clubs&nbsp;Add" display="Add" href="index.cfm?fuseaction=wineclub.form&new=1&task=edit" /> 
							<cfmenuitem name="Set&nbsp;Current/Next&nbsp;Shipment" display="Set Current/Next Shipment" href="index.cfm?fuseaction=wineclub.setshipments" /> 
					</cfmenuitem>
					<cfmenuitem name="Members" display="Members" href="##">
							<cfmenuitem name="Members&nbsp;Search" display="Search" href="index.cfm?fuseaction=wineclub_subscriptions.home" /> 
							<cfmenuitem name="Members&nbsp;Add" display="Add" href="index.cfm?fuseaction=wineclub_subscriptions.form&new=1&task=edit" /> 
							<cfmenuitem name="Import" display="Import" href="index.cfm?fuseaction=wineclub_subscriptions.import" /> 
							<cfmenuitem name="Members&nbsp;Report" display="Report" href="index.cfm?fuseaction=wineclub_reports.member_report" /> 
							<cfmenuitem name="Upcoming&nbsp;Prepaid&nbsp;Expirations" display="Upcoming Prepaid Expirations" href="index.cfm?fuseaction=wineclub_reports.prepaid_expirations_report" /> 
					</cfmenuitem>
					<cfmenuitem name="Shipments" display="Shipments" href="##">
							<cfmenuitem name="Shipments&nbsp;List" display="List" href="index.cfm?fuseaction=wineclub_shipments.home&search_criteria=1" />
							<cfmenuitem name="Shipments&nbsp;Search" display="Search" href="index.cfm?fuseaction=wineclub_shipments.home" /> 
							<cfmenuitem name="Shipments&nbsp;Add" display="Add" href="index.cfm?fuseaction=wineclub_shipments.form&new=1&task=edit" /> 
							<cfmenuitem name="Shipments&nbsp;Report" display="Report" href="index.cfm?fuseaction=wineclub_reports.shipment_report" /> 
							
					</cfmenuitem>
			</cfmenuitem>
        </cfif>

				<!--- sub menu 4--->
				<cfif Val(request.get_storefront.allow_surcharges_bol)>
					<cfmenuitem name="Discounts&nbsp;/&nbsp;Surcharges" display="Discounts&nbsp;/&nbsp;Surcharges" href="##"  Style="width:169px;font-size:12.5px; font-weight:bold;">
						 <cfif Val(request.get_storefront.enable_gift_certs_bol)>
           
						<cfmenuitem name="Gift&nbsp;Certificates" display="Gift Certificates" href="##">
								
										<cfmenuitem name="Gift&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=1" /> 
										<cfmenuitem name="Gift&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.giftcert_add&amount_mon=0" /> 
										<cfmenuitem name="Create&nbsp;Batch" display="Create Batch" href="index.cfm?index.cfm?fuseaction=giftcerts.giftcert_add_batch" /> 
								</cfmenuitem>
						</cfif>
						<cfif Val(request.get_storefront.enable_coupons_bol)>
								<cfmenuitem name="Coupon" display="Coupon" href="##">
										<cfmenuitem name="Coupon&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=0" /> 
										<cfmenuitem name="Coupon&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.coupon_add&amount_mon=0" /> 
										
								</cfmenuitem>
						</cfif>
							<cfif Val(request.get_storefront.enable_non_coupon_discounts_bol)>	
								<cfmenuitem name="Non-Coupons" display="Non-Coupons" href="##">
										<cfmenuitem name="Non-Coupons&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.discount_search" /> 
										<cfmenuitem name="Non-Coupons&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.discount_add" /> 
								</cfmenuitem>
							</cfif>	
							
						
								<cfmenuitem name="Club&nbsp;Discounts" display="Club Discounts" href="##">
										<cfmenuitem name="Club&nbsp;Discounts&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.discount_search&wineclub_bol=1" /> 
										<cfmenuitem name="Club&nbsp;Discounts&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.discount_add&wineclub_bol=1" /> 
								</cfmenuitem>
								
							<cfif Val(request.get_storefront.allow_surcharges_bol)>
       							<cfmenuitem name="Surcharges" display="Surcharges" href="index.cfm?fuseaction=surcharges.main" />
	   			
        					</cfif>	
									
								
				</cfmenuitem>
		 
				<cfelse>
					<cfmenuitem name="Discounts" display="Discounts" href="##"  Style="width:97px;font-size:12.5px; font-weight:bold;"> 
				
				       
				        <cfif Val(request.get_storefront.enable_gift_certs_bol)>
				           
							<cfmenuitem name="Gift&nbsp;Certificates" display="Gift Certificates" href="##">
									
											<cfmenuitem name="Gift&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=1" /> 
											<cfmenuitem name="Gift&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.giftcert_add&amount_mon=0" /> 
											<cfmenuitem name="Create&nbsp;Batch" display="Create Batch" href="index.cfm?index.cfm?fuseaction=giftcerts.giftcert_add_batch" /> 
									</cfmenuitem>
							</cfif>
							<cfif Val(request.get_storefront.enable_coupons_bol)>
									<cfmenuitem name="Coupon" display="Coupon" href="##">
											<cfmenuitem name="Coupon&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.main&cash_equivalent_bol=0" /> 
											<cfmenuitem name="Coupon&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.coupon_add&amount_mon=0" /> 
											
									</cfmenuitem>
							</cfif>
								<cfif Val(request.get_storefront.enable_non_coupon_discounts_bol)>	
									<cfmenuitem name="Non-Coupons" display="Non-Coupons" href="##">
											<cfmenuitem name="Non-Coupons&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.discount_search" /> 
											<cfmenuitem name="Non-Coupons&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.discount_add" /> 
									</cfmenuitem>
								</cfif>	
								
							
									<cfmenuitem name="Club&nbsp;Discounts" display="Club Discounts" href="##">
											<cfmenuitem name="Club&nbsp;Discounts&nbsp;Search" display="Search" href="index.cfm?fuseaction=giftcerts.discount_search&wineclub_bol=1" /> 
											<cfmenuitem name="Club&nbsp;Discounts&nbsp;Add" display="Add" href="index.cfm?fuseaction=giftcerts.discount_add&wineclub_bol=1" /> 
									</cfmenuitem>
										
							<cfif Val(request.get_storefront.allow_surcharges_bol)>
       							<cfmenuitem name="Surcharges" display="Surcharges" href="index.cfm?fuseaction=surcharges.main" />
	   			
        					</cfif>	
						
					</cfmenuitem>
			</cfif>
    			
				<!--- sub menu 5--->
				<cfmenuitem name="Affiliates" display="Affiliates" href="##"  Style="width:90px;font-size:12.5px; font-weight:bold;"> 
					<cfmenuitem name="Affiliates&nbsp;Search" display="Search" href="index.cfm?fuseaction=affiliates.main" /> 
					<cfmenuitem name="Affiliates&nbsp;Add" display="Add" href="index.cfm?fuseaction=affiliates.add" /> 
					<cfmenuitem name="Affiliates&nbsp;Report&nbsp;All" display="Report All" href="index.cfm?fuseaction=affiliates.report" /> 
				</cfmenuitem>
      
				<!--- sub menu 6--->	
				<cfif (ListFind("5", request.get_storefront.storefront_id_int) eq 0)>
				<cfmenuitem name="Content" display="Content" href="##"  Style="width:86px;font-size:12.5px; font-weight:bold;">
					<cfmenuitem name="Management" display="Management" href="../index.cfm?editmode=1" /> 
					<cfmenuitem name="Homepage&nbsp;Options" display="Homepage Options" href="index.cfm?fuseaction=contentMgmtHomepage.home" /> 
					<cfmenuitem name="Content&nbsp;Categories" display="Categories" href="index.cfm?fuseaction=contentMgmtCategories.home" /> 
				
				</cfmenuitem>
			</cfif>
			
			<!--- sub menu 7--->
				<cfmenuitem name="Shipping" display="Shipping" href="index.cfm?fuseaction=ship_groups.home"  Style="width:90px;font-size:12.5px; font-weight:bold;">
				
				 	<cfmenuitem name="Product&nbsp;Ship&nbsp;Groups" display="Product Ship Groups" href="##">
						<cfmenuitem name="Product&nbsp;Ship&nbsp;Groups&nbsp;Search" display="Search" href="index.cfm?fuseaction=ship_groups.home" /> 
						<cfmenuitem name="Product&nbsp;Ship&nbsp;Groups&nbsp;Add" display="Add" href="index.cfm?fuseaction=ship_groups.formType" /> 
				
					</cfmenuitem>
               		 <cfif client.superuser_bol eq 1>
						<cfmenuitem name="Carriers" display="Carriers" href="index.cfm?fuseaction=carriers.home" /> 
						<cfmenuitem name="Carrier&nbsp;Codes" display="Carrier Codes" href="index.cfm?fuseaction=carrierCodes.home" /> 
						<cfmenuitem name="Carrier&nbsp;Service&nbsp;Levels" display="Carrier Service Levels" href="index.cfm?fuseaction=carrierServiceLevels.home" /> 
						<cfmenuitem name="FORT&nbsp;Service&nbsp;Levels" display="FORT Service Levels" href="index.cfm?fuseaction=carrierFortServiceLevels.home" /> 
						<cfmenuitem name="Fulfiller&nbsp;Carrier&nbsp;Account&nbsp;Numbers" display="Fulfiller Carrier Account Numbers" href="index.cfm?fuseaction=carrierRetailers.home" /> 
					</cfif>
					<cfmenuitem name="Default&nbsp;Carriers" display="Default Carriers" href="index.cfm?fuseaction=carrierStateStorefronts.home" /> 
					<cfmenuitem name="Fulfiller&nbsp;Shipping&nbsp;Accounts" display="Fulfiller Shipping Accounts" href="index.cfm?fuseaction=fulfillerShippingAccounts.home" /> 
					<cfmenuitem name="Shipping&nbsp;State&nbsp;Selection&nbsp;Page" display="Shipping State Selection Page" href="index.cfm?fuseaction=stateSpecification.home" /> 
				</cfmenuitem>
              <!--- sub menu 8--->
				<cfmenuitem name="Reports" display="Reports" href="##"  Style="width:86px;font-size:12.5px; font-weight:bold;"> 
					<cfmenuitem name="Reports&nbsp;Orders" display="Orders" href="##">
			<cfmenuitem name="Order&nbsp;Activity" display="Order Activity" href="index.cfm?fuseaction=order_reports.main" />
			<cfmenuitem name="Order&nbsp;History" display="Order History" href="index.cfm?fuseaction=reports.orderactivity_form" />
			<cfmenuitem name="Order&nbsp;Invoices" display="Order Invoices" href="index.cfm?fuseaction=reports.state_invoice_form" />
			 <cfmenuitem name="Daily&nbsp;Sales" display="Daily Sales" href="index.cfm?fuseaction=wineclub_reports.daily_sales_report" />
			<cfif request.get_storefront.storefront_id_int eq 35   OR (request.get_storefront.storefront_id_int eq 73)>
			<cfmenuitem name="Sales&nbsp;Report" display="Sales Report" href="##">
				<cfmenuitem name="Sales&nbsp;by&nbsp;Item" display="Sales by Item" href="index.cfm?fuseaction=reports.sales_by_item_form" />
				 <cfmenuitem name="Sales&nbsp;by&nbsp;Linktrack code" display="Sales by Linktrack code" href="index.cfm?fuseaction=reports.sales_by_linktrack_form" />
					<cfmenuitem name="Sales&nbsp;by&nbsp;Coupon&nbsp;code" display="Sales by Coupon code" href="index.cfm?fuseaction=reports.sales_by_coupon_form" />
			</cfmenuitem>
			</cfif>
			 <cfif NOT request.liveServer>
				<cfmenuitem name="Sales&nbsp;Summary&nbsp;and&nbsp;Detail&nbsp;Reports" display="Sales Summary and Detail Reports" href="index.cfm?fuseaction=reports.sales_summary_and_detail_form" />
				<cfmenuitem name="Newsletter&nbsp;Subscriber&nbsp;report" display="Newsletter Subscriber report" href="index.cfm?fuseaction=reports.newsletter_subscriber_form" />
			</cfif>
			 <cfmenuitem name="Wine&nbsp;Club&nbsp;Batch&nbsp;Sales" display="Wine Club Batch Sales" href="##" />
			 
		</cfmenuitem>
			<cfmenuitem name="Inventory" display="Inventory" href="index.cfm?fuseaction=wineclub_reports.wine_club_batch_sales_report">
				<cfmenuitem name="Depletion&nbsp;Summary" display="Depletion Summary" href="index.cfm?fuseaction=reports.inventory_depletion_report_form" />
				 <cfmenuitem name="Inventory&nbsp;Report" display="Inventory Report" href="index.cfm?fuseaction=reports.inventory_form" />	
			
			</cfmenuitem>
			<cfmenuitem name="Accounting" display="Accounting" href="##">
				<cfif client.superuser_bol eq 1 OR request.get_storefront.can_see_recons_bol>
					<cfmenuitem name="A_P&nbsp;Reconciliation" display="A/P Reconciliation" href="index.cfm?fuseaction=recons.home" />
				</cfif>

				<cfif client.superuser_bol eq 1>	
					<cfmenuitem name="A_R&nbsp;Recap" display="A/R Recap" href="/index.cfm?fuseaction=recaps.home" />	
				</cfif>         

				<cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
					<cfmenuitem name="Awards&nbsp;Mileage" display="Awards Mileage" href="index.cfm?fuseaction=reports.mileage_form" />	
				</cfif>
				<cfmenuitem name="Commissions" display="Commissions" href="index.cfm?fuseaction=reports.commission_form" />	
				<cfmenuitem name="Credit&nbsp;Card&nbsp;Report" display="Credit Card Report" href="index.cfm?fuseaction=reports.credit_card_form" />
				<cfmenuitem name="Gross&nbsp;Receipts&nbsp;Report" display="Gross Receipts Report" href="index.cfm?fuseaction=reports.gross_receipts_form" />
				<cfmenuitem name="Sales&nbsp;Tax" display="Sales Tax" href="index.cfm?fuseaction=reports.sales_tax_form" />
			</cfmenuitem>
			 <cfmenuitem name="Statistics" display="Statistics" href="##">
			 	<cfif Val(request.get_storefront.stat_reporting_bol)>
					<cfmenuitem name="Cart&nbsp;Activity" display="Cart Activity" href="index.cfm?fuseaction=reports.cart_form" />
			 		<cfmenuitem name="Search&nbsp;Activity" display="Search Activity" href="index.cfm?fuseaction=reports.search_activity_form" />
				</cfif>
				<cfmenuitem name="Statistics&nbsp;Report" display="Statistics Report" href="http://67.199.36.166/" />
				
			 </cfmenuitem>	
			 <cfmenuitem name="Shipping&nbsp;and&nbsp;Fulfillment" display="Shipping and Fulfillment" href="##">
			 	<cfmenuitem name="Fulfillment&nbsp;Report" display="Fulfillment Report" href="index.cfm?fuseaction=reports.fulfillment_form" />
				<cfmenuitem name="Product&nbsp;Expiration" display="Product Expiration" href="index.cfm?fuseaction=reports.product_expiration_form" />
				<cfmenuitem name="Shipment&nbsp;Eligibility" display="Shipment Eligibility" href="index.cfm?fuseaction=reports.shipment_eligibility_form" />
			 
			 </cfmenuitem>
			 <cfif Val(request.get_storefront.club_enabled_bol)>
			 	<cfmenuitem name="Wine&nbsp;Clubs" display="Wine Clubs" href="##">
			  		<cfmenuitem name="Wine&nbsp;ClubsMembers" display="Members" href="index.cfm?fuseaction=wineclub_reports.member_report" />
			   			<cfmenuitem name="Wine&nbsp;ClubsShipments" display="Shipments" href="index.cfm?fuseaction=wineclub_reports.shipment_report" />
			    	
				</cfmenuitem>
			</cfif>
				 <cfmenuitem name="Direct&nbsp;States" display="Direct States" href="##">
			    	<cfmenuitem name="NH&nbsp;Report" display="NH Report" href="index.cfm?fuseaction=directReports.nhForm" />
				</cfmenuitem>
				<cfmenuitem name="Customers" display="Customers" href="index.cfm?fuseaction=reports.customer_listing_form" />
		</cfmenuitem>
	
				<!--- sub menu9--->
				<cfmenuitem name="Tools" display="Tools" href="##"  Style="width:75px;font-size:12.5px; font-weight:bold;">
					<cfmenuitem name="Email&nbsp;Campaign&nbsp;Manager" display="Email Campaign Manager" href="eblaster/index.cfm" />
					  <cfif get_storefront.payment_provider_vc IS "Verisign">
								<cfset ppurl = "https://manager.verisign.com">
						<cfelseif get_storefront.payment_provider_vc IS "Skipjack">
									<cfset ppurl ="https://secure.skipjack.com/">
						<cfelseif get_storefront.payment_provider_vc IS "Authorize.net">
									<cfset ppurl = "https://account.authorize.net">
						<cfelseif get_storefront.payment_provider_vc is "Tranvia">
									<cfset ppurl = "https://www.nobelpay.com/prod/npmu/Login.asp">
						<cfelse>
									<cfset ppurl = "https://account.authorize.net"> 				
						</cfif>
					<cfmenuitem name="Payment&nbsp;Provider" display="Wine Club Batch Sales" href="#ppurl#" />
					<cfmenuitem name="WSNET&nbsp;Order&nbsp;Export" display="WSNET Order Export" href="index.cfm?fuseaction=tools.export_wsn" />
					<cfmenuitem name="Help" display="Help" href="help/WSN_Admin_Guide.htm" />
					<cfmenuitem name="Tutorials&nbsp;and&nbsp;Training" display="Tutorials and Training" href="index.cfm?fuseaction=tools.training" />
					<cfmenuitem name="Google&nbsp;Analytics" display="Google Analytics" href="index.cfm?fuseaction=tools.google_analytics" />
	   			<cfif request.liveServer>
              		<cfset cfurl = "http://www.800ship.com/">
                <cfelse>
               		 <cfset cfurl = "http://dev.800ship.com:8950/">
                </cfif>
		    <cfmenuitem name="Central&nbsp;Fulfillment" display="Central Fulfillment" href="#cfurl#" />
			 <cfmenuitem name="Admin&nbsp;Activity&nbsp;Log" display="Admin Activity Log" href="index.cfm?fuseaction=tools.admin_activity_log" />
			  <cfif client.superuser_bol eq 1111> 
			  		<cfmenuitem name="A/P&nbsp;Recons&nbsp;and&nbsp;A/R&nbsp;Recaps" display="A/P Recons and A/R Recaps" href="##">
							<cfmenuitem name="A/P&nbsp;Recons&nbsp;and&nbsp;A/R&nbsp;Recaps" display="A/P Recons and A/R Recaps" href="index.cfm?fuseaction=recons.home" />
			  		</cfmenuitem>
			  </cfif>
			   <cfif (ListFind("20", request.get_storefront.storefront_id_int) neq 0)>
			   <cfmenuitem name="Sales&nbsp;Events" display="Sales Events" href="index.cfm?fuseaction=events.main" />
			   </cfif>
				</cfmenuitem> 
				<!--- sub menu 10--->
				<cfmenuitem name="Set&nbsp;Up" display="Set Up" href="##" Style="width:75px;font-size:12.5px; font-weight:bold;">
					<cfmenuitem name="Change&nbsp;Password" display="Change Password" href="index.cfm?fuseaction=tools.changepassword" />
					<cfmenuitem name="Fulfillers/Suppliers" display="Fulfillers/Suppliers" href="##">
						<cfmenuitem name="View&nbsp;All" display="View All" href="index.cfm?fuseaction=retailers.main&search_criteria=1" />
						<cfmenuitem name="FulfillersSupAdd" display="Add" href="index.cfm?fuseaction=retailers.form&task=edit&new=1" />
						<cfmenuitem name="Multi-Eligibility Settings" display="Multi-Eligibility Settings" href="index.cfm?fuseaction=retailers2.multi" />
					</cfmenuitem>
				 <cfif client.superuser_bol eq 1>
					<cfmenuitem name="Storefronts" display="Storefronts" href="index.cfm?fuseaction=storefronts.main" />
					<cfmenuitem name="Admins" display="Admins" href="index.cfm?fuseaction=admins.main">
						<cfmenuitem name="AdminsSearch" display="Search" href="index.cfm?fuseaction=admins.main" />
						<cfmenuitem name="AdminsAdd" display="Add" href="index.cfm?fuseaction=admins.add"/>
					</cfmenuitem>
					<cfmenuitem name="Phone&nbsp;Types" display="Phone Types" href="index.cfm?fuseaction=phone_types.main">
						<cfmenuitem name="Phone&nbsp;TypesSearch" display="Search" href="index.cfm?fuseaction=phone_types.main" />
						<cfmenuitem name="Phone&nbsp;TypesAdd" display="Add" href="index.cfm?fuseaction=phone_types.add"/>
					</cfmenuitem>
					<cfmenuitem name="Weights" display="Weights" href="index.cfm?fuseaction=weights.main&search_criteria=1">
						<cfmenuitem name="WeightsSearch" display="Search" href="index.cfm?fuseaction=weights.main&search_criteria=1" />
						<cfmenuitem name="WeightsAdd" display="Add" href="index.cfm?fuseaction=weights.add"/>
					</cfmenuitem>
					</cfif> 
					<cfmenuitem name="WSN&nbsp;State&nbsp;Charges" display="WSN State Charges" href="index.cfm?fuseaction=wsn.main" />
					
					<cfmenuitem name="Compliance&nbsp;Table" display="Compliance Table" href="index.cfm?fuseaction=storefront_state_info.main" />
					<cfif Val(request.get_storefront.enable_source_codes_bol)>
						<cfmenuitem name="Source&nbsp;Codes" display="Source Codes" href="index.cfm?fuseaction=source_codes.main">
						<cfmenuitem name="SourceSearch" display="Search" href="index.cfm?fuseaction=source_codes.main" />
						<cfmenuitem name="SourceAdd" display="Add" href="index.cfm?fuseaction=source_codes.add" />
					</cfmenuitem>
					</cfif>
					<cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
						<cfmenuitem name="Awards&nbsp;Programs" display="Awards Programs" href="index.cfm?fuseaction=awards.main">
								<cfmenuitem name="AwardsView&nbsp;All" display="View All" href="index.cfm?fuseaction=awards.main" />
								<cfmenuitem name="AwardsAdd" display="Add" href="index.cfm?fuseaction=awards.add" />
						</cfmenuitem>
					</cfif>
					<cfmenuitem name="Commissions&nbsp;" display="Commissions" href="##">
						<cfmenuitem name="CommissionsView&nbsp;All" display="View All" href="index.cfm?fuseaction=commissions.main" />
						<cfmenuitem name="CommissionsAdd" display="Add" href="index.cfm?fuseaction=commissions.add" />
						<cfmenuitem name="Settings" display="Settings" href="index.cfm?fuseaction=commissions.settings" />
						<cfmenuitem name="Misc&nbsp;Charges&nbsp;" display="Misc Charges" href="">
							<cfmenuitem name="MiscView&nbsp;All" display="View All" href="index.cfm?fuseaction=commissions.miscChargesHome" />
							<cfmenuitem name="MiscAdd&nbsp;" display="Add" href="index.cfm?fuseaction=commissions.miscChargesAdd" />
						</cfmenuitem>
					</cfmenuitem>
					
					<cfmenuitem name="A/P&nbsp;Recons" display="A/P Recons" href="##">
					<cfmenuitem name="Fulfillment&nbsp;Rates" display="Fulfillment Rates" href="index.cfm?fuseaction=fulfillmentrates.home">
						<cfmenuitem name="FulfillmentSearch" display="Search" href="index.cfm?fuseaction=fulfillmentrates.searchForm" />
						<cfmenuitem name="FulfillmentAdd" display="Add" href="index.cfm?fuseaction=fulfillmentrates.form&new=1" />
					</cfmenuitem>
					<cfmenuitem name="Misc&nbsp;Charges" display="Misc Charges" href="index.cfm?fuseaction=MiscCharges.home">
						<cfmenuitem name="MiscSearch" display="Search" href="index.cfm?fuseaction=MiscCharges.searchForm" />
						<cfmenuitem name="MiscAdd" display="Add" href="index.cfm?fuseaction=MiscCharges.form" />
						<cfmenuitem name="Types" display="Types" href="">
							<cfmenuitem name="TypesSearch" display="Search" href="index.cfm?fuseaction=MiscChargeTypes.searchForm" />
							<cfmenuitem name="TypesAdd" display="Add" href="index.cfm?fuseaction=MiscChargeTypes.Form" />
						</cfmenuitem>
					</cfmenuitem>
					</cfmenuitem>
					 <cfif client.superuser_bol eq 1>
						<cfmenuitem name="Recaps" display="Recaps" href="">
							<cfmenuitem name="Recurring&nbsp;Charges" display="Recurring Charges" href="index.cfm?fuseaction=recapRecurringCharges.home">
								<cfmenuitem name="RecapsSearch" display="Search" href="index.cfm?fuseaction=recapRecurringCharges.searchForm" />
								<cfmenuitem name="RecapsAdd" display="Add" href="index.cfm?fuseaction=recapRecurringCharges.form" />
							</cfmenuitem>
						</cfmenuitem>
					</cfif>
				
				<cfmenuitem name="Meta&nbsp;Tags&nbsp;Admin" display="Meta Tags Admin" href="index.cfm?fuseaction=meta.home">
					<cfmenuitem name="MetaList&nbsp;All" display="List All" href="index.cfm?fuseaction=meta.home" />
					<cfmenuitem name="MetaSearch" display="Search" href="index.cfm?fuseaction=meta.searchForm" />
					<cfmenuitem name="MetaAdd" display="Add" href="index.cfm?fuseaction=meta.form" />
				</cfmenuitem>
				<cfif client.superuser_bol eq 1 AND Val(request.get_storefront.validate_HTML_bol)>
					<cfmenuitem name="URL&nbsp;Extensions" display="URL Extensions" href="index.cfm?fuseaction=extensions.main">
					<cfmenuitem name="URLView&nbsp;All" display="View All" href="index.cfm?fuseaction=extensions.main" />
					<cfmenuitem name="Add&nbsp;URL&nbsp;Extension" display="Add URL Extension" href="index.cfm?fuseaction=extensions.add"/>
					<cfmenuitem name="Validate&nbsp;All" display="Validate All" href="index.cfm?fuseaction=extensions.validateHTML" />
					<cfmenuitem name="Validate&nbsp;Invalid&nbsp;Only" display="Validate Invalid Only" href="index.cfm?fuseaction=extensions.validateHTML&invalid=yes" />
				</cfmenuitem>
				<cfelse>
					<cfmenuitem name="URL&nbsp;Extensions" display="URL Extensions" href="index.cfm?fuseaction=extensions.main" />
				</cfif>
				
				<cfmenuitem name="Locations" display="Locations" href="index.cfm?fuseaction=locations.main" />
				<cfmenuitem name="Blogs" display="Blogs" href="index.cfm?fuseaction=blogs.main" />
				<cfif NOT request.liveServer>
				<cfmenuitem name="Compliance&nbsp;Providers" display="Compliance Providers" href="index.cfm?fuseaction=compliance_providers.main" />
				<cfmenuitem name="<nobr>Sync&nbsp;Products&nbsp;with&nbsp;DSC</nobr>" display="<nobr>Sync Products with DSC</nobr>" href="index.cfm?fuseaction=compliance_processing.home" />
				<cfmenuitem name="Category&nbsp;Templates" display="Category Templates" href="index.cfm?fuseaction=category_templates.main" />
				</cfif>
				</cfmenuitem>
			</cfmenu>
	</body>
</html>
