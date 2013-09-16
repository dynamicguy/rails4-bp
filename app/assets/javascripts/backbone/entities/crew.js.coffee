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
			order: "direction"
			directions:
				"-1": "asc"
				1: "desc"

		state:
			sortKey: "name"
			order: 1
			pageSize: 10

	columns = [
		name: "id"
		cell: Backgrid.IntegerCell.extend(orderSeparator: "")
		editable: false
		sortable: true
	,
		name: "name"
		cell: "string"
		sortable: false
	,
		name: "avatar"
		cell: "string"
		sortable: false
	,
		name: "title"
		cell: "string"
		sortable: false
	,
		name: "species"
		cell: "string"
		sortable: false
	,
		name: "origin"
		cell: "string"
		sortable: false
	,
		name: "quote"
		cell: "text"
	]

	API =
		getCrews: ->
			crews = new Entities.CrewCollection
				reset: true
			crews
#			grid = new Backgrid.Grid
#				columns: columns
#				collection: crews.fullCollection
#			paginator = new Paginator(
#				columns: columns
#				collection: crews
#			)



		fetchMoreCrews: (args) ->
			console.log args.collection.state
#			args.collection.getNextPage
#				fetch: true

#			crews = args.collection.getNextPage
#				fetch: true
#			crews


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