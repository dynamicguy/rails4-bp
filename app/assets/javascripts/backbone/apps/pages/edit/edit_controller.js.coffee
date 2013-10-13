@Rails4Bp.module "PagesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { page, id } = options
      page = App.request "page:entity", id
      @listenTo page, "updated", ->
        App.vent.trigger "page:updated", page
      App.execute "when:fetched", page, =>
        @layout = @getLayoutView page
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion page
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (page) ->
      editView = @getEditView page
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "page:cancelled", page
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (page) ->
      new Edit.Layout
        model: page

    getEditView: (page) ->
      new Edit.Page
        model: page

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar    