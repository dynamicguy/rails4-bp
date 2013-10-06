@Rails4Bp.module "CitiesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "cities/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			cityRegion: "#city-region"

	class Show.Breadcrumb extends App.Views.ItemView
	  template: "cities/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
	  template: "cities/show/_sidebar"

	class Show.City extends App.Views.ItemView
		template: "cities/show/show_city"

