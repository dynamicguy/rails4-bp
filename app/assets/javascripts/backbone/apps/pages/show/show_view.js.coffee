@Rails4Bp.module "PagesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "pages/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			pageRegion: "#page-region"

	class Show.Breadcrumb extends App.Views.ItemView
	  template: "pages/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
	  template: "pages/show/_sidebar"

	class Show.Page extends App.Views.ItemView
		template: "pages/show/show_page"

