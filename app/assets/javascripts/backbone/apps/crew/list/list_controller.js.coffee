@Rails4Bp.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	class List.Controller extends App.Controllers.Base
		initialize: ->
			crews = App.request "crew:entities"

			App.execute "when:fetched", crews, =>
				@layout = @getLayoutView crews
				@listenTo @layout, "close", @close
				@listenTo @layout, "show", =>
					@panelRegion()
					@crewRegion crews
				@show @layout

		titleRegion: ->
			titleView = @getTitleView()
			@layout.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()
			@listenTo panelView, "new:crew:button:clicked", =>
				@newRegion()
			@layout.panelRegion.show panelView

		newRegion: ->
			App.execute "new:crew:member", @layout.newRegion

		crewRegion: (crews) ->
			crewListView = @getCrewView crews

			@listenTo crewListView, "crews:scrolled", (args) ->
				App.vent.trigger "crews:more", args

			@listenTo crewListView, "childview:crew:member:clicked", (child, args) ->
				App.vent.trigger "crew:member:clicked", args.model

			@listenTo crewListView, "childview:crew:delete:clicked", (child, args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

			@layout.crewRegion.show crewListView

			columns = [
				name: "id"
				cell: Backgrid.IntegerCell.extend(orderSeparator: "")
				editable: false
			,
				name: "age"
				cell: "number"
			,
				name: "name"
				cell: "string"
			,
				name: "avatar"
				cell: "string"
			,
				name: "title"
				cell: "string"
			,
				name: "species"
				cell: "string"
			,
				name: "origin"
				cell: "string"
			,
				name: "quote"
				cell: "string"
			]

			if crewListView.hasOwnProperty 'collection'
				grid = new Backgrid.Grid
					className: "backgrid table table-striped table-bordered table-hover"
					collection: crewListView.collection.fullCollection
					columns: columns
				$("#grid").append(grid.render().$el)

				Paginator = Backgrid.Extension.Paginator.extend(
					windowSize: 20 # Default is 10
					hasFastForward: true # true is the xt: ">"
					fastForwardHandleLabels:
						prev: "<"
						next: ">"
				)
				paginator = new Paginator(
					columns: columns
					collection: crewListView.collection
				)
				$("#paginator").append paginator.render().$el
				crewListView.collection.getFirstPage()


		getCrewView: (crews) ->
			new List.Crew
				collection: crews

		getPanelView: ->
			new List.Panel

		getTitleView: ->
			new List.Title

		getLayoutView: (crews) ->
			new List.Layout
				collection: crews