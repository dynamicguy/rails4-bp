@Rails4Bp.module "PagesApp", (PagesApp, App, Backbone, Marionette, $, _) ->
  class PagesApp.Router extends Marionette.AppRouter
    appRoutes:
      "pages/:id": "show"
      "pages/:id/edit": "edit"
      "pages": "list"

  API =
    newPage: (region) ->
      new PagesApp.New.Controller
        region: region

    list: ->
      new PagesApp.List.Controller

    show: (id, page) ->
      new PagesApp.Show.Controller
        id: id
        page: page

    edit: (id, page) ->
      new PagesApp.Edit.Controller
        id: id
        page: page

  App.commands.setHandler "new:page", (region) ->
    API.newPage region

  App.vent.on "page:clicked page:created", (page) ->
    App.navigate Routes.edit_page_path(page.id)
    API.edit page.id, page

  App.vent.on "page:cancelled page:updated", (page) ->
    App.navigate Routes.pages_path()
    API.list()

  App.addInitializer ->
    new PagesApp.Router
      controller: API