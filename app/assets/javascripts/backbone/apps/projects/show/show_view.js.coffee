@Rails4Bp.module "ProjectsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "projects/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			projectRegion: "#project-region"

	class Show.Breadcrumb extends App.Views.ItemView
	  template: "projects/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
	  template: "projects/show/_sidebar"

	class Show.Project extends App.Views.ItemView
		template: "projects/show/show_project"

