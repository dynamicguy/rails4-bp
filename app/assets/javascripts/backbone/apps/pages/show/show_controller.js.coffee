@Rails4Bp.module "PagesApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends App.Controllers.Base
  
    initialize: (options) ->
      { page, id } = options
      page or= App.request "page:entity", id

      App.execute "when:fetched", page, =>
        @layout = @getLayoutView page
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @pageRegion page
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    pageRegion: (page) ->
      showView = @getShowView page
      @layout.pageRegion.show showView

    getLayoutView: (page) ->
      new Show.Layout
        model: page

    getShowView: (page) ->
      new Show.Page
        model: page

    getBreadcrumbView: ->
      new Show.Breadcrumb

    getSidebarView: ->
      new Show.Sidebar
