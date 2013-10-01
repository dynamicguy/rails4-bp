@Rails4Bp.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	class Edit.Layout extends App.Views.Layout
		template: "crew/edit/edit_layout"
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: 	"#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "crew/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "crew/edit/_sidebar"

	class Edit.Crew extends App.Views.ItemView
		template: "crew/edit/edit_crew"
		# 
		# onFormSubmit: (data) ->
		# 	console.log "Edit.Crew onFormSubmit", data
		# 	false