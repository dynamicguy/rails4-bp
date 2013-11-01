@Rails4Bp.module "CountriesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "countries/edit/edit_layout"
		events:
			"click .country-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault()
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: "#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "countries/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "countries/edit/_sidebar"

	class Edit.Country extends App.Views.ItemView
		template: "countries/edit/edit_country"
