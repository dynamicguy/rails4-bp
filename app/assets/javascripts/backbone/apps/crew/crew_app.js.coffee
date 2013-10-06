@Rails4Bp.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->
	class CrewApp.Router extends Marionette.AppRouter
		appRoutes:
			"crews/:id": "show"
			"crews/:id/edit": "edit"
			"crews": "list"

	API =
		newCrew: (region) ->
			new CrewApp.New.Controller
				region: region

		list: ->
			new CrewApp.List.Controller

		edit: (id, crew) ->
			new CrewApp.Edit.Controller
				id: id
				crew: crew

		show: (id, crew) ->
			new CrewApp.Show.Controller
				id: id
				crew: crew

	App.commands.setHandler "new:crew:crew", (region) ->
		API.newCrew region

	App.vent.on "crew:crew:clicked crew:created", (crew) ->
		App.navigate Routes.edit_crew_path(crew.id)
		API.edit crew.id, crew

	App.vent.on "crew:cancelled crew:updated", (crew) ->
		App.navigate Routes.crews_path()
		API.list()

	App.addInitializer ->
		new CrewApp.Router
			controller: API