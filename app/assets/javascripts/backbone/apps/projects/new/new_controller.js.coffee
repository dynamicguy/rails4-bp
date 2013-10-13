@Rails4Bp.module "ProjectsApp.New", (New, App, Backbone, Marionette, $, _) ->
  class New.Controller extends App.Controllers.Base
    initialize: ->
      project = App.request "new:project:entity"
      @listenTo project, "created", ->
        App.vent.trigger "project:created", project
      newView = @getNewView project
      formView = App.request "form:wrapper", newView
      @listenTo newView, "form:cancel", =>
        @region.close()
      @show formView

    getNewView: (project) ->
      new New.Project
        model: project
