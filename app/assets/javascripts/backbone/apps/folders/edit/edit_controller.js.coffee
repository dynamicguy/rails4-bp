@Rails4Bp.module "FoldersApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { folder, id } = options
      folder = App.request "folder:entity", id
      @listenTo folder, "updated", ->
        App.vent.trigger "folder:updated", folder
      App.execute "when:fetched", folder, =>
        @layout = @getLayoutView folder
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion folder
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (folder) ->
      editView = @getEditView folder
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "folder:cancelled", folder
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (folder) ->
      new Edit.Layout
        model: folder

    getEditView: (folder) ->
      new Edit.Folder
        model: folder

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar    