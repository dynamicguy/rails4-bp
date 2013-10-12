@Rails4Bp.module "PagesApp.New", (New, App, Backbone, Marionette, $, _) ->
  class New.Controller extends App.Controllers.Base

    initialize: ->
      page = App.request "new:page:entity"
      @listenTo page, "created", ->
        App.vent.trigger "page:created", page
      newView = @getNewView page
      formView = App.request "form:wrapper", newView
      @listenTo newView, "form:cancel", =>
        @region.close()
      @show formView

    getNewView: (page) ->
      new New.Page
        model: page
