@Rails4Bp.module "FoldersApp", (FoldersApp, App, Backbone, Marionette, $, _) ->
  class FoldersApp.Router extends Marionette.AppRouter
    appRoutes:
      "folders/:id": "show"
      "folders/:id/edit": "edit"
      "folders": "list"

  API =
    show: (id, folder) ->
      new FoldersApp.Show.Controller
        id: id
        folder: folder

    edit: (id, folder) ->
      new FoldersApp.Edit.Controller
        id: id
        folder: folder

    newFolder: (region) ->
      new FoldersApp.New.Controller
        region: region

    list: ->
      new FoldersApp.List.Controller


  App.commands.setHandler "new:folder", (region) ->
    API.newFolder region

  App.vent.on "folder:clicked folder:created", (folder) ->
    App.navigate Routes.edit_folder_path(folder.id)
    API.edit folder.id, folder

  App.vent.on "folder:cancelled folder:updated", (folder) ->
    App.navigate Routes.folders_path()
    API.list()

  App.addInitializer ->
    new FoldersApp.Router
      controller: API
