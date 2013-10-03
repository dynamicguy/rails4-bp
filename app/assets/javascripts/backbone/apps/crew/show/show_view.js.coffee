@Rails4Bp.module "CrewApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	class Show.Layout extends App.Views.Layout
		template: "crew/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			crewRegion: "#crew-region"

	class Show.Crew extends App.Views.ItemView
		template: "crew/show/show_crew"

	class Show.Breadcrumb extends App.Views.ItemView
		template: "crew/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
		template: "crew/show/_sidebar"
