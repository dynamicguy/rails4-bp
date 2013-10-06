@<%= js_application_name %>.module "<%= module_name_class %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->
	class <%= @controller %>.Controller extends App.Controllers.Base
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

    getBreadcrumbView: ->
    	new <%= @controller %>.Breadcrumb

    getSidebarView: ->
    	new <%= @controller %>.Sidebar

    getLayoutView: ->
    	new <%= @controller %>.Layout
