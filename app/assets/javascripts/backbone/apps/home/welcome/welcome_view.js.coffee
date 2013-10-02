@Rails4Bp.module "HomeApp.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->
	class Welcome.Layout extends App.Views.Layout
		template: "home/welcome/welcome_layout"
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			contentBlockRegion: "#content-block"

	class Welcome.Breadcrumb extends App.Views.ItemView
		template: "home/welcome/_breadcrumb"

	class Welcome.Sidebar extends App.Views.ItemView
		template: "home/welcome/_sidebar"

