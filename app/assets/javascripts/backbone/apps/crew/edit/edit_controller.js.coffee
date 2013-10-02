@Rails4Bp.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	class Edit.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ crew, id } = options
			crew = App.request "crew:entity", id
			@listenTo crew, "updated", ->
				App.vent.trigger "crew:updated", crew
			App.execute "when:fetched", crew, =>
				@layout = @getLayoutView crew
				@listenTo @layout, "show", =>
					@breadcrumbRegion()
					@sidebarRegion()
					@formRegion crew
				@show @layout

		breadcrumbRegion: ->
			breadcrumbView = @getBreadcrumbView()
			@layout.breadcrumbRegion.show breadcrumbView

		sidebarRegion: ->
			sidebarView = @getSidebarView()
			@layout.sidebarRegion.show sidebarView

		formRegion: (crew) ->
			editView = @getEditView crew
			@listenTo editView, "form:cancel", ->
				App.vent.trigger "crew:cancelled", crew
			formView = App.request "form:wrapper", editView
			@layout.formRegion.show formView

		getLayoutView: (crew) ->
			new Edit.Layout
				model: crew

		getEditView: (crew) ->
			new Edit.Crew
				model: crew

		getBreadcrumbView: ->
			new Edit.Breadcrumb

		getSidebarView: ->
			new Edit.Sidebar
