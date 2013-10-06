@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.City extends Entities.Model
		initialize: ->
			@url = (if @id then "/cities/" + @id else "/cities")

	class Entities.CitiesCollection extends App.Entities.PageableCollection
		model: Entities.City
		url: ->
			Routes.cities_path()

		queryParams:
			sortKey: "order"
			order: "dir"
			directions:
				"-1": "asc"
				1: "desc"

		state:
			pageSize: 20
			sortKey: "id"
			order: 1

	API =
		getCities: ->
			new Entities.CitiesCollection

		getCity: (id) ->
			city = new Entities.City
				id: id
			city.fetch()
			city

		newCity: ->
			new Entities.City

	App.reqres.setHandler "city:entities", ->
		API.getCities()

	App.reqres.setHandler "city:entity", (id) ->
		API.getCity id

	App.reqres.setHandler "new:city:entity", ->
		API.newCity()