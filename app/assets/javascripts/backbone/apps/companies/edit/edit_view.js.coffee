@Rails4Bp.module "CompaniesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "companies/edit/edit_layout"
		events:
			"click .company-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault()
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: "#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "companies/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "companies/edit/_sidebar"

	class Edit.Company extends App.Views.ItemView
		template: "companies/edit/edit_company"
