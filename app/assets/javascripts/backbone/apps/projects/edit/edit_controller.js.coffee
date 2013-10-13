@Rails4Bp.module "ProjectsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { project, id } = options
      project = App.request "project:entity", id
      @listenTo project, "updated", ->
        App.vent.trigger "project:updated", project
      App.execute "when:fetched", project, =>
        @layout = @getLayoutView project
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion project
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (project) ->
      editView = @getEditView project
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "project:cancelled", project
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (project) ->
      new Edit.Layout
        model: project

    getEditView: (project) ->
      new Edit.Project
        model: project

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar    