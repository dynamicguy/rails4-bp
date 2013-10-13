@Rails4Bp.module "CompaniesApp.New", (New, App, Backbone, Marionette, $, _) ->
  class New.Controller extends App.Controllers.Base

    initialize: ->
      company = App.request "new:company:entity"
      @listenTo company, "created", ->
        App.vent.trigger "company:created", company
      newView = @getNewView company
      formView = App.request "form:wrapper", newView
      @listenTo newView, "form:cancel", =>
        @region.close()
      @show formView

    getNewView: (company) ->
      new New.Company
        model: company
