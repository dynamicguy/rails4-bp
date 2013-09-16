@Rails4Bp.module "UsersApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new Show.Layout