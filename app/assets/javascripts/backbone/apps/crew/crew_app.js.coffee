@Rails4Bp.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->
	class CrewApp.Router extends Marionette.AppRouter
		appRoutes:
			"crew/:id/edit": "edit"
			"crew": "list"

	API =
		list: ->
			new CrewApp.List.Controller

		newCrew: (region) ->
			new CrewApp.New.Controller
				region: region

		edit: (id, member) ->
			new CrewApp.Edit.Controller
				id: id
				crew: member

	App.commands.setHandler "new:crew:member", (region) ->
		API.newCrew region

	App.vent.on "crew:member:clicked crew:created", (member) ->
		App.navigate Routes.edit_crew_path(member.id)
		API.edit member.id, member

	App.vent.on "crew:cancelled crew:updated", (crew) ->
		App.navigate Routes.crews_path()
		API.list()

	App.addInitializer ->
		new CrewApp.Router
			controller: API