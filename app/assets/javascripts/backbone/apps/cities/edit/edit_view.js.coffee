@Rails4Bp.module "CitiesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	class Edit.Layout extends App.Views.Layout
		template: "cities/edit/edit_layout"
		events:
			"click .city-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault()
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: "#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "cities/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "cities/edit/_sidebar"

	class Edit.City extends App.Views.ItemView
		template: "cities/edit/edit_city"