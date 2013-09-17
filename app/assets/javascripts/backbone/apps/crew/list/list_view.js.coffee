@Rails4Bp.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	class List.Layout extends App.Views.Layout
		template: "crew/list/list_layout"
		regions:
			titleRegion: "#title-region"
			panelRegion: "#panel-region"
			newRegion: "#new-region"
			crewRegion: "#crew-region"

	class List.Title extends App.Views.ItemView
		template: "crew/list/_title"

	class List.Panel extends App.Views.ItemView
		template: "crew/list/_panel"
		className: 'row'

		triggers:
			"click #new-crew": "new:crew:button:clicked"

	class List.CrewMember extends App.Views.ItemView
		template: "crew/list/_crew_member"
		tagName: "li"
		className: "crew-member media list-group-item"

		triggers:
			"click .crew-delete button": "crew:delete:clicked"
			"click": "crew:member:clicked"

	class List.Empty extends App.Views.ItemView
		template: "crew/list/_empty"
		tagName: "li"

	class List.Crew extends App.Views.CompositeView
		template: "crew/list/_crew"
		id: "crewList"
		className: 'row'

		triggers:
			"scroll": "crew:scrolled"


