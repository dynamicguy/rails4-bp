@Rails4Bp.module "CrewApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base
		initialize: (options) ->
			{ crew, id } = options
			crew or= App.request "crew:entity", id

			App.execute "when:fetched", crew, =>
				@layout = @getLayoutView crew
				@listenTo @layout, "show", =>
					@breadcrumbRegion()
					@sidebarRegion()
					@crewRegion crew
				@show @layout

		breadcrumbRegion: ->
			breadcrumbView = @getBreadcrumbView()
			@layout.breadcrumbRegion.show breadcrumbView

		sidebarRegion: ->
			sidebarView = @getSidebarView()
			@layout.sidebarRegion.show sidebarView

		crewRegion: (crew) ->
			showView = @getShowView crew
			@layout.crewRegion.show showView

		getLayoutView: (crew) ->
			new Show.Layout
				model: crew

		getShowView: (crew) ->
			new Show.Crew
				model: crew

		getBreadcrumbView: ->
			new Show.Breadcrumb

		getSidebarView: ->
			new Show.Sidebar
