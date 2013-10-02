@Rails4Bp.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	class List.Layout extends App.Views.Layout
		template: "crew/list/list_layout"
		regions:
			pageHeaderRegion: "#page-header-region"
			panelRegion: "#panel-region"
			newRegion: "#new-region"
			crewRegion: "#crew-region"
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"

	class List.Breadcrumb extends App.Views.ItemView
		template: "crew/list/_breadcrumb"

	class List.Sidebar extends App.Views.ItemView
		template: "crew/list/_sidebar"

	class List.Panel extends App.Views.ItemView
		template: "crew/list/_panel"
		className: 'row'

		triggers:
			"click #new-crew": "new:crew:button:clicked"

	class List.Crewcrew extends App.Views.ItemView
		template: "crew/list/_crew_crew"
		tagName: "li"
		className: "crew-crew media list-group-item"

		triggers:
			"click": "crew:crew:clicked"

	class List.Crew extends App.Views.CompositeView
		template: "crew/list/_crew"
		id: "crewList"

		triggers:
			"scroll": "crew:scrolled"


