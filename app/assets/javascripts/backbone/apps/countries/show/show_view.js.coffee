@Rails4Bp.module "CountriesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "countries/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			countryRegion: "#country-region"

	class Show.Breadcrumb extends App.Views.ItemView
	  template: "countries/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
	  template: "countries/show/_sidebar"

	class Show.Country extends App.Views.ItemView
		template: "countries/show/show_country"

