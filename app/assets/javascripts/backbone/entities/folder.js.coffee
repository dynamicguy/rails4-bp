@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Folder extends Entities.Model
    initialize: ->
      @url = (if @id then "/folders/" + @id else "/folders")

  class Entities.FoldersCollection extends App.Entities.PageableCollection
    model: Entities.Folder
    url: ->
      Routes.folders_path()
    queryParams:
      sortKey: "order"
      order: "dir"
      directions:
        "-1": "asc"
        1: "desc"
    state:
      pageSize: 20
      sortKey: "id"
      order: 1

  API =
    getFolders: ->
      folders = new Entities.FoldersCollection
      folders.fetch
        reset: true
      folders

    getFolder: (id) ->
      folder = new Entities.Folder
        id: id
      folder.fetch()
      folder

    newFolder: ->
      new Entities.Folder

  App.reqres.setHandler "folder:entities", ->
    API.getFolders()

  App.reqres.setHandler "folder:entity", (id) ->
    API.getFolder id

  App.reqres.setHandler "new:folder:entity", ->
    API.newFolder()
