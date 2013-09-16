@Rails4Bp.module "ProfilesApp", (ProfilesApp, App, Backbone, Marionette, $, _) ->

  class ProfilesApp.Router extends Marionette.AppRouter
    appRoutes:
      "list": "list"
      "show": "show"
    
  API =
    list: ->
      new ProfilesApp.List.Controller

    show: ->
      new ProfilesApp.Show.Controller

      
  App.addInitializer ->
    new ProfilesApp.Router
      controller: API
  