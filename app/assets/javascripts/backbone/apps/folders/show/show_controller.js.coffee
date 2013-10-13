@Rails4Bp.module "FoldersApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends App.Controllers.Base
  
    initialize: (options) ->
      { folder, id } = options
      folder or= App.request "folder:entity", id

      App.execute "when:fetched", folder, =>
        @layout = @getLayoutView folder
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @folderRegion folder
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    folderRegion: (folder) ->
      showView = @getShowView folder
      @layout.folderRegion.show showView

    getLayoutView: (folder) ->
      new Show.Layout
        model: folder

    getShowView: (folder) ->
      new Show.Folder
        model: folder

    getBreadcrumbView: ->
      new Show.Breadcrumb

    getSidebarView: ->
      new Show.Sidebar
