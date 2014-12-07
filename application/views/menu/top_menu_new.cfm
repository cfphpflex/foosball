<script language="JavaScript" vqptag="datafile" type="text/javascript">
 
<cfquery name="qGetICEStorefronts" datasource="#request.dsn#">
             SELECT storefront_id_int
             FROM storefront
             WHERE payment_provider_vc =   'ICE'
</cfquery>
	
<!--- getsfid list --->
<cfset sfICEIDList  =  valuelist(qGetICEStorefronts.storefront_id_int)     >


<cfset dayofWeek = DayOfWeek(now())>
<cfset thisWeeksFromDate = DateAdd("d", -1 * dayOfWeek, now())>
<cfset thisMonthsFromDate = CreateDate(DatePart("yyyy", now()), DatePart("m", now()), 1)>
<cfset onHoldDatePeriod = DateAdd("d", -61, now())>
<cfset tstamp="#dateformat(now(), 'mmddyyyy')##timeformat(now(), 'HHmmss')#">
</script>
<cfparam name="client.admin_storefront_id" default="1">
<cfoutput>
<div align="center">
	<!--Header Starts Here-->
	<div id="header">
		<div id="head-container">
			<div id="logo">
				<p><!---<a href="##"><img src="/admin/images_new/logo_header.png" alt="" title="" /></a>--->
				<a href="##"><img src="images/logo_storefront_id_#client.admin_storefront_id#.gif" height="50" width="250" alt="" title="" /></a>
				</p>
			</div>			
			<form action="/admin/<cfoutput>#request.self#</cfoutput>?fuseaction=hub.search" method="post" name="go" id="go">
			<div id="search">
				<ul class="enterarea"><li>Search: <input name="keyword" type="text" class="inputbox" /></li><li><input type="submit" value="Go" class="submitBtn3"> </li></ul>
				<p class="prod-ord-cust"><input name="lookupType" type="radio" value="items" checked="checked" />Products <input name="lookupType" type="radio" value="orders" />Orders <input name="lookupType" type="radio" value="clients" />Customers</p>
			</div>
			</form>
			<div id="help">
				<p><!---<a href="../help/WSN_Admin_Guide.htm" class="help">---><a href="/admin/index.cfm?fuseaction=mainhelp.main" class="help">Help</a> <span>|</span> <a href="#request.self#?fuseaction=login.logout" class="logout">Logout</a></p>
			</div>
		</div>
	</div>
	<!--Header Ends Here-->
	<!--Top Navigation Starts Here-->
	<div id="topnav">
		<div id="topnav-container">
			<div id="menu">
				<ul id="header-nav">
					<li class="general"><a href="##"><span>Orders</span></a>
						
						<ul>
							<li><a href="/admin/index.cfm?fuseaction=orders.today">Recent Orders</a></li>
							<li><a href="/admin/index.cfm?fuseaction=orders.main&amp;search_criteria=1&amp;from_dt=#DateFormat(thisWeeksFromDate,'mm/dd/yyyy')#">This Week&rsquo;s Orders</a></li>
							<li><a href="/admin/index.cfm?fuseaction=orders.main&amp;search_criteria=1&amp;from_dt=#DateFormat(thisMonthsFromDate,'mm/dd/yyyy')#">This Month&rsquo;s Orders</a></li>
							<li><a href="/admin/index.cfm?fuseaction=orders.main">Simple Search</a></li>
							<li><a href="/admin/index.cfm?fuseaction=orders.main&amp;searchmode=advanced">Advanced Search</a></li>
							<!--- <li><a href="/admin/index.cfm?fuseaction=orders.add">Add Order - Single Recipients</a></li> --->
							<li><a href="/admin/index.cfm?fuseaction=addOrder.main&amp;newOrder=1">Add New Order</a></li>		
							<li><a href="/admin/index.cfm?fuseaction=orders.main&amp;search_criteria=1&amp;from_dt=#DateFormat(onHoldDatePeriod,'mm/dd/yyyy')#&amp;onHold=yes">Orders On Hold</a></li>
							<li><a href="/admin/index.cfm?fuseaction=orders.ordimportForm">Import Orders</a></li>
						</ul>
								
							</li>
					<li class="general"><a href="##"><span>Products</span></a>
						<ul>
							<li><a href="/admin/index.cfm?fuseaction=items.home">Search</a></li>
							<li><a href="/admin/index.cfm?fuseaction=items.form&amp;new=1&amp;task=edit">Add Standard</a></li>
							<li><a href="/admin/index.cfm?fuseaction=items.form&amp;new=1&amp;task=edit&amp;Type=1">Add Combo</a></li>
							 <!--- <cfif client.superuser_bol eq 1> --->
							 <cfif (client.superuser_bol eq 1) OR (IsDefined("client.storefront_manager_bol") AND Val(client.storefront_manager_bol))>
							<li><a href="/admin/index.cfm?fuseaction=items.importForm">Import Products</a></li>
							</cfif>
							<!--- </cfif> --->
							<li><a href="/admin/index.cfm?fuseaction=items.copy_page1">Copy Product(s)</a>
							</li>
							<cfif client.superuser_bol eq 1 or client.multi_storefront_admin_bol eq 1>
								<li><a href="/admin/index.cfm?fuseaction=items.dropship_page1">Create Drop-Ship Product(s)</a></li>
							</cfif>
							<cfif client.superuser_bol eq 1>
							<li><a href="/admin/index.cfm?fuseaction=items.markup_page1">Adjust Retail Prices</a></li>
							</cfif>
							<li><a href="/admin/index.cfm?fuseaction=contentMgmtCategories.home">Categories</a></li>
							<li><a href="/admin/index.cfm?fuseaction=items.find_fulfiller">Find Fulfiller</a></li>
							<li><a href="/admin/index.cfm?fuseaction=items.master_fulfillment_form">Master Fulfillment List</a></li>
							<li><a href="/admin/index.cfm?fuseaction=reports.shipment_eligibility_form">Shipment Eligibility Report</a></li>
							<li><a href="/admin/index.cfm?fuseaction=items.grid">Product Grid</a></li>
						 	<!--- ONLY ICE storefront allowed to see Maritz Grid per  FORT Re-pricing Cross Reference Table  Created: 6/12/2013--->
						 	
						 	<li><a href="/admin/index.cfm?fuseaction=items.maritz">Maritz Grid</a></li>
							
						  
						 	 
							<li><a href="/admin/index.cfm?fuseaction=attributes.main">Product Attributes</a></li>
							<li><a href="/admin/index.cfm?fuseaction=allocations.main">Wine Allocations</a></li>
							<cfif ListFindNoCase("34,35,73", request.get_storefront.storefront_id_int) neq 0>
							<li><a href="/admin/index.cfm?fuseaction=reviews.main">Product Reviews</a></li>
							</cfif>
							<cfif (request.get_storefront.storefront_id_int eq 35) OR (request.get_storefront.storefront_id_int eq 36) OR (request.get_storefront.storefront_id_int eq 73)>
							<li><a href="/admin/index.cfm?fuseaction=items.sort">Rank Products by...</a>
								<ul>
								<li><a href="/admin/index.cfm?fuseaction=items.sort">Flavor</a></li>
								<li><a href="/admin/index.cfm?fuseaction=items.sort&amp;combo=1">Popularity</a></li>
								</ul>
							</li>
							</cfif>
							  <cfif ListFindNoCase("30,35,73", request.get_storefront.storefront_id_int) neq 0>
							  <li><a href="/admin/index.cfm?fuseaction=items.showInserts">Collateral Inserts</a></li>
							</cfif>
						</ul>
					</li>
					<li class="general"><a href="##"><span>Clients</span></a>
						<ul>							
							<li><a href="/admin/index.cfm?fuseaction=clients.main">Search</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.add">Add</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clientuserlevels.main">Client Group</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.merge">Merge Clients</a></li>
							<li><a href="/admin/index.cfm?fuseaction=clients.importForm">Import Clients</a></li>
							<cfif NOT request.liveServer>
							<li><a href="/admin/index.cfm?fuseaction=orders.main">Surveys</a></li>
							</cfif>
							
						</ul>						
					</li>
					 <cfif Val(request.get_storefront.club_enabled_bol)>
						<li class="general"><a href="##"><span>Clubs</span></a>
							<ul>
								<li><a href="/admin/index.cfm?fuseaction=wineclub.home">Clubs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>							
										<li><a href="/admin/index.cfm?fuseaction=wineclub.home">List</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub.form&amp;new=1&amp;task=edit">Add</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub.setshipments">Set Current/Next Shipment</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub.cardexpirationnotice">Card Expiration Notice</a></li>
									</ul>
								</li>	
								<li><a href="/admin/index.cfm?fuseaction=wineclub.home">Members&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>							
										<li><a href="/admin/index.cfm?fuseaction=wineclub_subscriptions.home">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_subscriptions.form&amp;new=1&amp;task=edit">Add</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_subscriptions.import">Import</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.member_report">Report</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.prepaid_expirations_report">Upcoming Prepaid Expirations</a></li>
									</ul>
								</li>	
								<li><a href="/admin/index.cfm?fuseaction=wineclub.home">Shipments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>							
										<li><a href="/admin/index.cfm?fuseaction=wineclub_shipments.home&amp;search_criteria=1">List</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_shipments.home">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_shipments.form&amp;new=1&amp;task=edit">Add</a></li>
										<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.shipment_report">Report</a></li>										
									</ul>
								</li>	
							</ul>	
						</li>
					</cfif>
					<cfif Val(request.get_storefront.allow_surcharges_bol)>
					<li class="general"><a href="##"><span>Discounts&nbsp;/&nbsp;Surcharges</span></a>
					<cfelse>
					<li class="general"><a href="##"><span>Discounts</span></a>
					</cfif>
						<ul>
							<cfif Val(request.get_storefront.enable_gift_certs_bol)>
								<li><a href="/admin/index.cfm?fuseaction=giftcerts.main&amp;cash_equivalent_bol=1">Gift Certificates&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>							
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.main&amp;cash_equivalent_bol=1">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.giftcert_add&amp;amount_mon=0">Add</a></li>
										<!---Code has been modified for BTID 4185--->
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.giftcert_add_batch">Create Batch</a></li>
									</ul>
								</li>
							</cfif>
							 <cfif Val(request.get_storefront.enable_coupons_bol)>
								<li><a href="/admin/index.cfm?fuseaction=giftcerts.main&amp;cash_equivalent_bol=0">Coupon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>							
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.main&amp;cash_equivalent_bol=0">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.coupon_add&amp;amount_mon=0">Add</a></li>
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.coupon_add_batch">Create Batch</a></li>																				
									</ul>
								</li>
							</cfif>
							<cfif Val(request.get_storefront.enable_non_coupon_discounts_bol)>
								<li><a href="/admin/index.cfm?fuseaction=giftcerts.discount_search">Non-Coupons&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>							
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.discount_search">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=giftcerts.discount_add">Add</a></li>																				
									</ul>
								</li>
							</cfif>
							<li><a href="/admin/index.cfm?fuseaction=giftcerts.discount_search&amp;wineclub_bol=1">Club Discounts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>							
									<li><a href="/admin/index.cfm?fuseaction=giftcerts.discount_search&amp;wineclub_bol=1">Search</a></li>
									<li><a href="/admin/index.cfm?fuseaction=giftcerts.discount_add&amp;wineclub_bol=1">Add</a></li>																				
								</ul>
							</li>
							 <cfif Val(request.get_storefront.allow_surcharges_bol)>
								<li><a href="/admin/index.cfm?fuseaction=surcharges.main">Surcharges</a></li>
							</cfif>
							
						</ul>		
					</li>
					<li class="general"><a href="##"><span>Affiliates</span></a>
						<ul>
							<li><a href="/admin/index.cfm?fuseaction=affiliates.main">Search</a></li>
							<li><a href="/admin/index.cfm?fuseaction=affiliates.add">Add</a></li>
							<li><a href="/admin/index.cfm?fuseaction=affiliates.report">Report All</a></li>
						</ul>
					</li>
					<li class="general"><a href="##"><span>Content</span></a>
						<cfif (ListFind("5", request.get_storefront.storefront_id_int) eq 0)>
							<ul>
								<!---<li><a href="../../index.cfm?editmode=1">Management</a></li>--->
								<cfif  ListFind('1,68,69,71,72,74,76,77,81',request.get_storefront.storefront_id_int) OR request.get_storefront.payment_provider_vc eq 'ice'>
									<li><a href="/admin/index.cfm?fuseaction=contentMgmtFrontEnd.home">Homepage</a></li>
								</cfif>
								<li><a href="/admin/index.cfm?fuseaction=contentMgmtCategories.home">Categories</a></li>
								<cfif  ListFind('1,60,68,69,71,72,74,76,77,81,82',request.get_storefront.storefront_id_int) OR request.get_storefront.payment_provider_vc eq 'ice'>
									<li><a href="/admin/index.cfm?fuseaction=contentMgmtMenu.home">Menus</a></li>
								</cfif>
							</ul>
						</cfif>
					</li>
					<li class="general"><a href="##"><span>Shipping</span></a>
						<ul>
						<li><a href="/admin/index.cfm?fuseaction=ship_groups.home">Product Ship Groups&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
							<ul>
								<li><a href="/admin/index.cfm?fuseaction=ship_groups.home">Search</a></li>
								<li><a href="/admin/index.cfm?fuseaction=ship_groups.formType">Add</a></li>								
							</ul>
						</li>						
						<cfif client.superuser_bol eq 1>							
								<li><a href="/admin/index.cfm?fuseaction=carriers.home">Carriers</a></li>
								<li><a href="/admin/index.cfm?fuseaction=carrierCodes.home">Carrier Codes</a></li>
								<li><a href="/admin/index.cfm?fuseaction=carrierServiceLevels.home">Carrier Service Levels</a></li>
								<li><a href="/admin/index.cfm?fuseaction=carrierFortServiceLevels.home">FORT Service Levels</a></li>
								<li><a href="/admin/index.cfm?fuseaction=carrierRetailers.home">Fulfiller Carrier Account Numbers</a></li>
								<li><a href="/admin/index.cfm?fuseaction=carrierStateStorefronts.home">Default Carriers</a></li>
								<li><a href="/admin/index.cfm?fuseaction=fulfillerShippingAccounts.home">Fulfiller Shipping Accounts</a></li>
							
						</cfif>
						<li><a href="/admin/index.cfm?fuseaction=stateSpecification.home">Shipping State Selection Page</a></li>
						</ul>
					</li>
					<li class="general"><a href="##"><span>Reports</span></a>
						<ul>
							<li><a>Orders&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>
									<li><a href="/admin/index.cfm?fuseaction=order_reports.main">Order Activity</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.orderactivity_form">Order History</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.state_invoice_form">Order Invoices</a></li>
									<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.daily_sales_report">Daily Sales</a></li>
									
									<cfif request.get_storefront.storefront_id_int eq 35   OR (request.get_storefront.storefront_id_int eq 73)>
									<li><a>Sales Report</a>
										<ul>
											<li><a href="/admin/index.cfm?fuseaction=reports.sales_by_item_form">Sales by Item</a></li>
											<li><a href="/admin/index.cfm?fuseaction=reports.sales_by_linktrack_form">Sales by Linktrack code</a></li>
											<li><a href="/admin/index.cfm?fuseaction=reports.sales_by_coupon_form">Sales by Coupon code</a></li>
										</ul>
									</li>	 					
									</cfif>
									<cfif NOT request.liveServer>	
									<li><a href="/admin/index.cfm?fuseaction=reports.sales_summary_and_detail_form">Sales Summary and Detail Reports</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.newsletter_subscriber_form">Newsletter Subscriber report</a></li>
									</cfif>
									<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.wine_club_batch_sales_report">Wine Club Batch Sales</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.order_export">Order Export</a></li>	
									<li><a href="/admin/index.cfm?fuseaction=reports.order_sales_tax">Order Sales Tax Report</a></li>									
								</ul>
							</li>
							
							
							<li><a>Inventory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>
									<li><a href="/admin/index.cfm?fuseaction=reports.inventory_depletion_report_form">Depletion Summary</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.inventory_form">Inventory Report</a></li>
								</ul>
							</li>
							
							<li><a>Accounting&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>
									<cfif client.superuser_bol eq 1 OR request.get_storefront.can_see_recons_bol>
									<li><a href="/admin/index.cfm?fuseaction=recons.home">A/P Reconciliation</a></li>
									</cfif>
									<cfif client.superuser_bol eq 1>
									<li><a href="/admin/index.cfm?fuseaction=recaps.home">A/R Recap</a></li>
									</cfif>
									<cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
									<li><a href="/admin/index.cfm?fuseaction=reports.mileage_form">Awards Mileage</a></li>
									</cfif>
									<li><a href="/admin/index.cfm?fuseaction=reports.commission_form">Commissions</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.credit_card_form">Credit Card Report</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.gross_receipts_form">Gross Receipts Report</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.sales_tax_form">Sales Tax</a></li>
									<li><a href="/admin/index.cfm?fuseaction=reports.sales_details_form">Sales Detail Report</a></li>
								</ul>
							</li>
							
							<li><a>Statistics&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>
									<cfif Val(request.get_storefront.stat_reporting_bol)>
									<li><a href="/admin/index.cfm?fuseaction=reports.cart_form">Cart Activity</a></li>									
									<li><a href="/admin/index.cfm?fuseaction=reports.search_activity_form">Search Activity</a></li>
									</cfif>									
								</ul>
							</li>
							
							<li><a>Shipping and Fulfillment&nbsp;&nbsp;>></a>
								<ul>
							
									<li><a href="/admin/index.cfm?fuseaction=reports.fulfillment_form">Fulfillment Report</a></li>									
									<li><a href="/admin/index.cfm?fuseaction=reports.product_expiration_form">Product Expiration</a></li>									
									<li><a href="/admin/index.cfm?fuseaction=reports.shipment_eligibility_form">Shipment Eligibility</a></li>
								</ul>
							</li>
							<cfif Val(request.get_storefront.club_enabled_bol)>
								<li><a>Wine Clubs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>
							
									<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.member_report">Members</a></li>									
									<li><a href="/admin/index.cfm?fuseaction=wineclub_reports.shipment_report">Shipments</a></li>	
								</ul>
							</li>							
							</cfif>
							<li><a href="/admin/index.cfm?fuseaction=reports.customer_listing_form">Customers</a></li>							
						</ul>
					</li>
					<cfif get_storefront.payment_provider_vc IS "Verisign">
						<cfset paymenturl = "https://manager.paypal.com">
					<cfelseif get_storefront.payment_provider_vc IS "Paypal">
						<cfset paymenturl = "https://manager.paypal.com/" >					
					<cfelseif get_storefront.payment_provider_vc IS "Skipjack">
						<cfset paymenturl = "https://secure.skipjack.com/" >
					<cfelseif get_storefront.payment_provider_vc IS "Authorize.net">
						<cfset paymenturl = "https://account.authorize.net" >
					<cfelseif get_storefront.payment_provider_vc is "Tranvia">
						<cfset paymenturl = "https://www.nobelpay.com/prod/npmu/Login.asp">
					<cfelse>
						<cfset paymenturl = "https://account.authorize.net"> 				
					</cfif>		
					<li class="general"><a href="##"><span>Tools</span></a>
						<ul>
							<!--- ONLY ICE storefront allowed to see Maritz Grid per  FORT Re-pricing Cross Reference Table  Created: 6/12/2013--->
						 	<li><a href="/admin/storefrontmanager/storefronts/1/pages/GeneralInfo.cfm?storefrontid=#client.admin_storefront_id#">Storefront Manager</a></li>
						 	
						 	
							<li><a href="/admin/eblaster/index.cfm">Email Campaign Manager</a></li>
						<!---	<li><a href="/admin/index.cfm?fuseaction=eblaster1.main">Email Campaign Manager</a></li>--->
							
						
						 	
							<li><a href="#paymenturl#">Payment Provider</a></li>
							<li><a href="/admin/index.cfm?fuseaction=tools.export_wsn">WSNET Order Export</a></li>
							<li><a href="/admin/index.cfm?fuseaction=tools.export_warehouse">Warehouse Order Export</a></li>
							<!---<li><a  style="cursor:pointer" onclick="javascript:window.open('/admin/help/WSN_Admin_Guide.htm')">Help</a></li>--->
							<li><a href="/admin/index.cfm?fuseaction=mainhelp.main">Help</a></li>
							<cfif client.superuser_bol eq 1>
							<li><a href="/admin/index.cfm?fuseaction=tools.helpmanagement">Help Management</a></li>
							</cfif>
							<li><a href="/admin/index.cfm?fuseaction=tools.training">Tutorials and Training</a></li>
							<li><a href="/admin/index.cfm?fuseaction=tools.google_analytics">Google Analytics</a></li>
							<li><a href="/admin/index.cfm?fuseaction=tools.sitemap">Generate Sitemap</a></li>
						 	<cfif request.liveServer>						
							<li><a href="http://www.800ship.com/">Central Fulfillment</a></li>
							<cfelse>							
							<li><a href="http://dev.800ship.com:8950/">Central Fulfillment</a></li>
							</cfif>
							<li><a href="/admin/index.cfm?fuseaction=tools.admin_activity_log">Admin Activity Log</a></li>
							<cfif client.superuser_bol eq 1111> 
								<li><a>A/P Recons and A/R Recaps</a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=recons.home">Recons</a></li>
										<li><a href="/admin/index.cfm?fuseaction=recaps.home">Recaps</a></li>
									</ul>
								</li>		
							</cfif>
							 <cfif (ListFind("20", request.get_storefront.storefront_id_int) neq 0)>
                     			  <li><a href="/admin/index.cfm?fuseaction=events.main">Sales Events</a></li>                    
               				 </cfif>		
						</ul>						
					</li>
					
					<li class="general"><a href="##"><span>Set Up</span></a>
						<ul>														
							<li><a href="/admin/index.cfm?fuseaction=tools.changepassword">Change Password</a></li>
							<li><a href="/admin/index.cfm?fuseaction=tools.layoutsettings">Admin Templates</a></li>																				
							<li><a href="/admin/index.cfm?fuseaction=retailers2.main&amp;search_criteria=1">Fulfillers/Suppliers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								<ul>
									<li><a href="/admin/index.cfm?fuseaction=retailers.main&amp;search_criteria=1">View All</a></li>
									<li><a href="/admin/index.cfm?fuseaction=retailers.form&amp;task=edit&amp;new=1">Add</a></li>
									<li><a href="/admin/index.cfm?fuseaction=retailers.multi">Multi-Eligibility Settings</a></li>
									<cfif client.superuser_bol eq 1>
										<li><a href="/admin/index.cfm?fuseaction=retailers.import">Import</a></li>
									</cfif>
								</ul>
							</li>
							 <cfif client.superuser_bol eq 1>
							 	<li><a href="/admin/index.cfm?fuseaction=storefronts.main">Storefronts</a></li>
								<li><a href="/admin/index.cfm?fuseaction=admins.main">Admins&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=admins.main">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=admins.add">Add</a></li>
									</ul>
								</li>
								<li><a href="/admin/index.cfm?fuseaction=phone_types.main">Phone Types&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=phone_types.main">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=phone_types.add">Add</a></li>
									</ul>
								</li>
								<li><a href="/admin/index.cfm?fuseaction=weights.main&amp;search_criteria=1">Weights&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=weights.main&amp;search_criteria=1">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=weights.add">Add</a></li>
									</ul>
								</li>								
							 </cfif>	
							 <li><a href="/admin/index.cfm?fuseaction=wsn.main">WSN State Charges</a></li>
							 <li><a href="/admin/index.cfm?fuseaction=storefront_state_info.main">Compliance Table</a></li>
							  <cfif Val(request.get_storefront.enable_source_codes_bol)>
							  	<li><a href="/admin/index.cfm?fuseaction=source_codes.main">Source Codes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=source_codes.main">Search</a></li>
										<li><a href="/admin/index.cfm?fuseaction=source_codes.add">Add</a></li>
									</ul>
								</li>
							  </cfif>
							   <cfif Val(request.get_storefront.prompt_for_awards_account_bol)>
							   	<li><a href="/admin/index.cfm?fuseaction=awards.main">Awards Programs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=awards.main">View All</a></li>
										<li><a href="/admin/index.cfm?fuseaction=awards.add">Add</a></li>
									</ul>
								</li>
							   </cfif>
							   <li><a href="/admin/index.cfm?fuseaction=commissions.main">Commissions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=commissions.main">View All</a></li>
										<li><a href="/admin/index.cfm?fuseaction=commissions.add">Add</a></li>
										<li><a href="/admin/index.cfm?fuseaction=commissions.settings">Settings</a></li>
										<li href="/admin/index.cfm?fuseaction=commissions.miscChargesHome"><a >Misc Charges&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
											<ul>
												<li><a href="/admin/index.cfm?fuseaction=commissions.miscChargesHome">View All</a></li>
												<li><a href="/admin/index.cfm?fuseaction=commissions.miscChargesAdd">Add</a></li>	
											</ul>
										</li>
									</ul>
								</li>
								
								<li><a href="/admin/index.cfm?fuseaction=awards.main">A/P Recons&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
									<ul>
										<li><a href="/admin/index.cfm?fuseaction=fulfillmentrates.home">Fulfillment Rates&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
											<ul>
												<li><a href="/admin/index.cfm?fuseaction=fulfillmentrates.searchForm">Search</a></li>
												<li><a href="/admin/index.cfm?fuseaction=fulfillmentrates.form&amp;new=1">Add</a></li>
											</ul>
										</li>								
										<li><a href="/admin/index.cfm?fuseaction=MiscCharges.home">Misc Charges&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
											<ul>
												<li><a href="/admin/index.cfm?fuseaction=MiscCharges.searchForm">Search</a></li>
												<li><a href="/admin/index.cfm?fuseaction=MiscCharges.form">Add</a></li>
												<li><a href="/admin/index.cfm?fuseaction=MiscChargeTypes.home">Types&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
													<ul>
														<li><a href="/admin/index.cfm?fuseaction=MiscChargeTypes.searchForm">Search</a></li>
														<li><a href="/admin/index.cfm?fuseaction=MiscChargeTypes.form">Add</a>
													</ul>
												</li>	
											</ul>
										</li>
									</ul>
								</li>
								
								 <cfif client.superuser_bol eq 1>
								 <li><a >Recaps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								 	<ul>
										 <li><a href="/admin/index.cfm?fuseaction=recapRecurringCharges.home">Recurring Charges</a>
										 	<ul>
												<a href="/admin/index.cfm?fuseaction=recapRecurringCharges.searchForm">Search</a>
												<a href="/admin/index.cfm?fuseaction=recapRecurringCharges.form">Add</a>
											</ul>
										 </li>
									</ul>
								 </li>
								 </cfif>
								 <li><a href="/admin/index.cfm?fuseaction=meta.home">Meta Tags Admin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></a>
								 	<ul>
										 <li><a href="/admin/index.cfm?fuseaction=meta.home">List All</a> </li>
										 <li><a href="/admin/index.cfm?fuseaction=meta.searchForm">Search</a> </li>
										 <li><a href="/admin/index.cfm?fuseaction=meta.form">Add</a> </li>
									</ul>
								 </li>
								<cfif client.superuser_bol eq 1 AND Val(request.get_storefront.validate_HTML_bol)>
								  <li><a href="/admin/index.cfm?fuseaction=extensions.main">URL Extensions</a>
								 	<ul>
										 <li><a href="/admin/index.cfm?fuseaction=extensions.main">View All</a> </li>
										 <li><a href="/admin/index.cfm?fuseaction=extensions.add">Add URL Extension</a> </li>
										 <li><a href="/admin/index.cfm?fuseaction=extensions.validateHTML">Validate All</a> </li>
										 <li><a href="/admin/index.cfm?fuseaction=extensions.validateHTML&amp;invalid=yes">Validate Invalid Only</a> </li>
									</ul>
								 </li>
								 <cfelse>
								 	  <li><a href="/admin/index.cfm?fuseaction=extensions.main">URL Extensions</a> </li>
								</cfif>
								 <li><a href="/admin/index.cfm?fuseaction=locations.main">Locations</a> </li>
								 <li><a href="/admin/index.cfm?fuseaction=blogs.main">Blogs</a> </li>
								 <cfif (client.superuser_bol eq 1) OR (IsDefined("session.ice_storefront_bol") AND (Val(session.ice_storefront_bol) EQ 1))>
								 <li><a href="/admin/index.cfm?fuseaction=ice.main">ICE Configuration</a> </li>
								 </cfif>
								 <cfif NOT request.liveServer>
								 <li><a href="/admin/index.cfm?fuseaction=compliance_providers.main">Compliance Providers</a> </li>
								 <li><a href="/admin/index.cfm?fuseaction=compliance_processing.home"><nobr>Sync Products with DSC</nobr></a> </li>
								<!--- <li><a href="/admin/index.cfm?fuseaction=category_templates.main">Category Templates</a> </li>--->
								 </cfif>
							   
						</ul>										
							
					</li>
				</ul>
			</div>
			<div id="store">
			<table border="0" cellspacing="0"  cellpadding="0">
		
			<cfif Val(client.superuser_bol)>
			<cfinclude template="/800wineAdmin/storefronts/qry_get_all_storefronts.cfm">
			<form action="/admin/index.cfm?fuseaction=storefronts.switchstorefront&tstamp=#tstamp#" method="post" name="oForm" id="oForm">
			<td align="right" nowrap>
				<span style="color: ##FFF;">Storefront:</span>&nbsp;
				<select name="ADMINstorefrontid" onChange="submit();" style="width:150px">
				<cfloop query="get_all_storefronts">
					<option value="#get_all_storefronts.storefront_id_int#" <cfif client.admin_storefront_id eq get_all_storefronts.storefront_id_int> selected</cfif>>#get_all_storefronts.storefront_name_vc#</option>
				</cfloop>	
				</select>&nbsp;
			</td></form>
			<cfelseif val(client.multi_storefront_admin_bol) or val(client.storefront_manager_bol)>
					<cfinclude template="/800wineAdmin/storefronts/qry_get_associated_storefronts.cfm">
			<form action="/admin/index.cfm?fuseaction=storefronts.switchstorefront" method="post" name="oForm" id="oForm">
			<td align="right" nowrap>
				<span style="color: ##FFF;">Storefront:</span>&nbsp;
				<select name="ADMINstorefrontid" onChange="submit();" style="width:150px">
				<cfloop query="get_associated_storefronts">
					<option value="#get_associated_storefronts.storefront_id_int#" <cfif client.admin_storefront_id eq get_associated_storefronts.storefront_id_int> selected</cfif>>#get_associated_storefronts.storefront_name_vc#</option>
				</cfloop>	
				</select>&nbsp;
			</td></form>
			
			</cfif>
			</table>
				<!---storefront: <select name=""><option>800wine.com</option></select>--->
			</div>
		</div>
	</div>
</cfoutput>
	<!--Top Navigation Ends Here-->
