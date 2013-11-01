@Rails4Bp.module "CountriesApp", (CountriesApp, App, Backbone, Marionette, $, _) ->

	class CountriesApp.Router extends Marionette.AppRouter
		appRoutes:
			"countries/:id": "show"
			"countries/:id/edit": "edit"
			"countries": "list"

	API =
                    		            
		show: (id, country) ->
			new CountriesApp.Show.Controller
				id: id
				country: country
            		            
		edit: (id, country) ->
			new CountriesApp.Edit.Controller
				id: id
				country: country
            		            		
		newCountry: (region) ->
			new CountriesApp.New.Controller
				region: region

		list: ->
			new CountriesApp.List.Controller


	App.commands.setHandler "new:country", (region) ->
		API.newCountry region

	App.vent.on "country:clicked country:created", (country) ->
		App.navigate Routes.edit_country_path(country.id)
		API.edit country.id, country

	App.vent.on "country:cancelled country:updated", (country) ->
		App.navigate Routes.countries_path()
		API.list()
	
	App.addInitializer ->
		new CountriesApp.Router
			controller: API
	