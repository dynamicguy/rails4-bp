@Rails4Bp.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new List.Layout