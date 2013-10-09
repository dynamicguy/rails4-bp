@Rails4Bp.module "CitiesApp", (CitiesApp, App, Backbone, Marionette, $, _) ->
	class CitiesApp.Router extends Marionette.AppRouter
		appRoutes:
			"cities/:id": "show"
			"cities/:id/edit": "edit"
			"cities": "list"

	API =
		newCity: (region) ->
			new CitiesApp.New.Controller
				region: region

		list: ->
			new CitiesApp.List.Controller

		show: (id, city) ->
			new CitiesApp.Show.Controller
				id: id
				city: city

		edit: (id, city) ->
			new CitiesApp.Edit.Controller
				id: id
				city: city

	App.commands.setHandler "new:city", (region) ->
		API.newCity region

	App.vent.on "city:clicked city:created", (city) ->
		App.navigate Routes.edit_city_path(city.id)
		API.edit city.id, city

	App.vent.on "city:cancelled city:updated", (city) ->
		App.navigate Routes.cities_path()
		API.list()

	App.addInitializer ->
		new CitiesApp.Router
			controller: API
  