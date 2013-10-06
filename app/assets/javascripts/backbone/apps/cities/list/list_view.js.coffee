@Rails4Bp.module "CitiesApp.List", (List, App, Backbone, Marionette, $, _) ->
	class List.Layout extends App.Views.Layout
		template: "cities/list/list_layout"
		regions:
			panelRegion: "#panel-region"
			newRegion: "#new-region"
			listRegion: "#list-region"
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"

	class List.Breadcrumb extends App.Views.ItemView
		template: "cities/list/_breadcrumb"

	class List.Sidebar extends App.Views.ItemView
		template: "cities/list/_sidebar"

	class List.Panel extends App.Views.ItemView
		template: "cities/list/_panel"
		className: 'row'
		triggers:
			"click #new-crew": "new:city:button:clicked"

	class List.ListView extends App.Views.CompositeView
		template: "cities/list/_list"
		id: "cityList"
