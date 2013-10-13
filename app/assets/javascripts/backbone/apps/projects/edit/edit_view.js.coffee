@Rails4Bp.module "ProjectsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "projects/edit/edit_layout"
		events:
			"click .project-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault()
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: "#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "projects/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "projects/edit/_sidebar"

	class Edit.Project extends App.Views.ItemView
		template: "projects/edit/edit_project"
