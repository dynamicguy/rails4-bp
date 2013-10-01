@Rails4Bp.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	class List.Controller extends App.Controllers.Base
		initialize: ->
			crews = App.request "crew:entities"

			App.execute "when:fetched", crews, =>
				@layout = @getLayoutView crews
				@listenTo @layout, "close", @close
				@listenTo @layout, "show", =>
					@breadcrumbRegion()
					@sidebarRegion()
					@panelRegion()
					@crewRegion crews
				@show @layout

		breadcrumbRegion: ->
			breadcrumbView = @getBreadcrumbView()
			@layout.breadcrumbRegion.show breadcrumbView

		sidebarRegion: ->
			sidebarView = @getSidebarView()
			@layout.sidebarRegion.show sidebarView

		panelRegion: ->
			panelView = @getPanelView()
			@listenTo panelView, "new:crew:button:clicked", =>
				@newRegion()
			@layout.panelRegion.show panelView

		newRegion: ->
			App.execute "new:crew:member", @layout.newRegion

		crewRegion: (crews) ->
			crewListView = @getCrewView crews
			@listenTo crewListView, "childview:crew:member:clicked", (child, args) ->
				App.vent.trigger "crew:member:clicked", child.model
			@layout.crewRegion.show crewListView

			ActionsCell = Backgrid.Cell.extend(
				className: 'actions'
				template: _.template("<a href='#crew/<%= id %>' class='btn btn-default btn-xs'><span class='glyphicon glyphicon-eye-open'></span></a> <a href='#crew/<%= id %>/edit' class='btn crew-edit btn-default btn-xs'><span class='glyphicon glyphicon-pencil'></span> </a> <button data-id='<%= id %>' class='crew-delete btn btn-danger btn-xs'><span class='glyphicon glyphicon-trash'></span></button>")
				events:
					"click .crew-delete": "deleteRow"
				deleteRow: (e) ->
					e.preventDefault() # stop the hash being added to the URL
					if confirm "Are you sure you want to delete #{@model.get("name")} with ID: #{@model.get("id")}?" then @model.destroy() else false
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
					collection: crewListView.collection
					columns: columns

				$("#grid").append(grid.render().$el)
				$("thead tr").addClass("warning")

				class Paginator extends Backgrid.Extension.Paginator
					columns: columns
					collection: crewListView.collection
					className: 'backgrid-paginator'

				paginator = new Paginator(
					columns: columns
					collection: crewListView.collection
				)
				$("#paginator").append paginator.render().$el

				class Filter extends Backgrid.Extension.ServerSideFilter
					template: _.template('<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control h35" type="text" <% if (placeholder) { %> placeholder="<%- placeholder %>" <% } %> name="<%- name %>" /><span class="input-group-addon"><a class="close" href="#">&times;</a></span></div>')
					className: 'backgrid-filter form-search'
					placeholder: "Search"
					collection: crewListView.collection

				filter = new Filter(
					collection: crewListView.collection
					fields: ["name", "breadcrumb", "species"]
				)
				$("#filters").append filter.render().$el

				crewListView.collection.fetch(reset: true)


		getCrewView: (crews) ->
			new List.Crew
				collection: crews

		getPanelView: ->
			new List.Panel

		getBreadcrumbView: ->
			new List.Breadcrumb

		getSidebarView: ->
			new List.Sidebar

		getLayoutView: (crews) ->
			new List.Layout
				collection: crews