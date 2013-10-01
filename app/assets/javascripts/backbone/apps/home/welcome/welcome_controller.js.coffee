@Rails4Bp.module "HomeApp.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->

  class Welcome.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new Welcome.Layout