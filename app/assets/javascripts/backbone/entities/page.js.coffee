@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Page extends Entities.Model
    initialize: ->
      @url = (if @id then "/pages/" + @id else "/pages")

  class Entities.PagesCollection extends App.Entities.PageableCollection
    model: Entities.Page
    url: ->
      Routes.pages_path()

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
    getPages: ->
      new Entities.PagesCollection

    getPage: (id) ->
      page = new Entities.Page
        id: id
      page.fetch()
      page

    newPage: ->
      new Entities.Page

  App.reqres.setHandler "page:entities", ->
    API.getPages()

  App.reqres.setHandler "page:entity", (id) ->
    API.getPage id

  App.reqres.setHandler "new:page:entity", ->
    API.newPage()
