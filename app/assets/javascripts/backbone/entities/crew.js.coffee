@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	class Entities.Crew extends App.Entities.Model
		urlRoot: ->
			Routes.crews_path()

	class Entities.CrewCollection extends App.Entities.PageableCollection
		model: Entities.Crew
		mode: "infinite"
		url: Routes.crews_path({format: 'json'})

		queryParams:
			totalPages: null
			totalRecords: null
			sortKey: "order"
			order: "dir"
			directions:
				"-1": "asc"
				1: "desc"

		state:
			firstPage: 1
			pageSize: 20
			sortKey: "id"
			order: 1

	API =
		getCrews: ->
			new Entities.CrewCollection()

		fetchMoreCrews: (args) ->
			console.log args.collection.state

		getCrewMember: (id) ->
			member = new Entities.Crew
				id: id
			member.fetch()
			member

		newCrewMember: ->
			new Entities.Crew

	App.reqres.setHandler "crew:entities", ->
		API.getCrews()

	App.reqres.setHandler "crew:fetch:more", (args)->
		API.fetchMoreCrews(args)

	App.reqres.setHandler "crew:entity", (id) ->
		API.getCrewMember id

	App.reqres.setHandler "new:crew:entity", ->
		API.newCrewMember()