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
				App.vent.trigger "crew:member:clicked", child.model

			@layout.crewRegion.show crewListView

			ActionsCell = Backgrid.Cell.extend(
				className: 'actions'
				template: _.template("<button data-id='<%= id %>' class='crew-edit btn btn-default btn-xs'><span class='glyphicon glyphicon-pencil'></span></button> <button data-id='<%= id %>' class='crew-delete btn btn-danger btn-xs'><span class='glyphicon glyphicon-trash'></span></button>")

				events:
					"click .crew-delete": "deleteRow"

				deleteRow: (e) ->
#					console.log @model
					if confirm "Are you sure you want to delete #{@model.get("name")} with ID: #{@model.get("id")}?" then @model.destroy({id: @model.get("id")}) else false

				render: ->
					@$el.html @template({id: @model.id})
					@delegateEvents()
					@
			)

			columns = [
				name: "name"
				cell: "string"
			,
				name: "age"
				cell: "number"
			,
				name: "title"
				cell: "string"
			,
				name: "species"
				cell: "string"
			,
				name: "id"
				label: "Actions"
				sortable: false
				editable: false
				cell: ActionsCell
			]

			if crewListView.hasOwnProperty 'collection'
				grid = new Backgrid.Grid
					className: "backgrid table table-striped table-bordered table-hover"
					collection: crewListView.collection.fullCollection
					columns: columns
				$("#grid").append(grid.render().$el)
				$("thead tr").addClass("warning")

				class Paginator extends Backgrid.Extension.Paginator
					windowSize: 20 # Default is 10
					className: 'pager'
					hasFastForward: true # true is the xt: ">"
					fastForwardHandleLabels:
						prev: '&larr; Older'
						next: 'Newer &rarr;'

				paginator = new Paginator(
					columns: columns
					collection: crewListView.collection
				)
				$("#paginator").append paginator.render().$el

				class Filter extends Backgrid.Extension.ServerSideFilter
					template: _.template('<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control h35" type="text" <% if (placeholder) { %> placeholder="<%- placeholder %>" <% } %> name="<%- name %>" /><span class="input-group-addon"><a class="close" href="#">&times;</a></span></div>')
					className: 'backgrid-filter form-search'
					placeholder: "Search"

				filter = new Filter(
					collection: crewListView.collection.fullCollection
					fields: ["name", "title", "species"]
				)
				$("#filters").append filter.render().$el

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