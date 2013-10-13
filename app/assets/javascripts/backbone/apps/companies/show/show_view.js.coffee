@Rails4Bp.module "CompaniesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "companies/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			companyRegion: "#company-region"

	class Show.Breadcrumb extends App.Views.ItemView
	  template: "companies/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
	  template: "companies/show/_sidebar"

	class Show.Company extends App.Views.ItemView
		template: "companies/show/show_company"

