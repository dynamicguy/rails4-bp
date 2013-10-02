@Rails4Bp.module "HomeApp.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->
	class Welcome.Controller extends App.Controllers.Base

		initialize: ->
			@layout = @getLayoutView()
			@listenTo @layout, "show", =>
				@breadcrumbRegion()
				@sidebarRegion()

			@show @layout

		breadcrumbRegion: ->
			breadcrumbView = @getBreadcrumbView()
			@layout.breadcrumbRegion.show breadcrumbView

		sidebarRegion: ->
			sidebarView = @getSidebarView()
			@layout.sidebarRegion.show sidebarView

		getLayoutView: ->
			new Welcome.Layout

		getBreadcrumbView: ->
			new Welcome.Breadcrumb

		getSidebarView: ->
			new Welcome.Sidebar
