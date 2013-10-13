@Rails4Bp.module "FoldersApp.New", (New, App, Backbone, Marionette, $, _) ->
  class New.Controller extends App.Controllers.Base

    initialize: ->
      folder = App.request "new:folder:entity"
      @listenTo folder, "created", ->
        App.vent.trigger "folder:created", folder
      newView = @getNewView folder
      formView = App.request "form:wrapper", newView
      @listenTo newView, "form:cancel", =>
        @region.close()
      @show formView

    getNewView: (folder) ->
      new New.Folder
        model: folder
