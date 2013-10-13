@Rails4Bp.module "ProjectsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends App.Controllers.Base
  
    initialize: (options) ->
      { project, id } = options
      project or= App.request "project:entity", id

      App.execute "when:fetched", project, =>
        @layout = @getLayoutView project
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @projectRegion project
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    projectRegion: (project) ->
      showView = @getShowView project
      @layout.projectRegion.show showView

    getLayoutView: (project) ->
      new Show.Layout
        model: project

    getShowView: (project) ->
      new Show.Project
        model: project

    getBreadcrumbView: ->
      new Show.Breadcrumb

    getSidebarView: ->
      new Show.Sidebar
