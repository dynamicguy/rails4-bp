@Rails4Bp.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      "users": "list"
      "users/:id": "show"
    
  API =
    list: ->
      new UsersApp.List.Controller

    show: ->
      new UsersApp.Show.Controller

      
  App.addInitializer ->
    new UsersApp.Router
      controller: API
  