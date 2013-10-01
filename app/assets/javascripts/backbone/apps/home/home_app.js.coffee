@Rails4Bp.module "HomeApp", (HomeApp, App, Backbone, Marionette, $, _) ->

  class HomeApp.Router extends Marionette.AppRouter
    appRoutes:
      "": "welcome"
    
  API =
    welcome: ->
      new HomeApp.Welcome.Controller

      
  App.addInitializer ->
    new HomeApp.Router
      controller: API
  