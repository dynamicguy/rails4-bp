@Rails4Bp.module "CitiesApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	class Show.Controller extends App.Controllers.Base
		initialize: (options) ->
			{ city, id } = options
			city or= App.request "city:entity", id

			App.execute "when:fetched", city, =>
				@layout = @getLayoutView city
				@listenTo @layout, "show", =>
					@breadcrumbRegion()
					@sidebarRegion()
					@cityRegion city
				@show @layout

		breadcrumbRegion: ->
			breadcrumbView = @getBreadcrumbView()
			@layout.breadcrumbRegion.show breadcrumbView

		sidebarRegion: ->
			sidebarView = @getSidebarView()
			@layout.sidebarRegion.show sidebarView

		cityRegion: (city) ->
			showView = @getShowView city
			@layout.cityRegion.show showView

		getLayoutView: (city) ->
			new Show.Layout
				model: city

		getShowView: (city) ->
			new Show.City
				model: city

		getBreadcrumbView: ->
			new Show.Breadcrumb

		getSidebarView: ->
			new Show.Sidebar
