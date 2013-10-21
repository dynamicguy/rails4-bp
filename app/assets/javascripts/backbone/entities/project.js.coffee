@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Project extends Entities.Model
    idAttribute: 'prj_id'
    initialize: ->
      @url = (if @id then "/projects/" + @id else "/projects")

  class Entities.ProjectsCollection extends App.Entities.PageableCollection
    model: Entities.Project
    url: ->
      Routes.projects_path()
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
    getProjects: ->
      projects = new Entities.ProjectsCollection
      projects.fetch
        reset: true
      projects

    getProject: (id) ->
      project = new Entities.Project
        prj_id: id
      project.fetch()
      project

    newProject: ->
      new Entities.Project

  App.reqres.setHandler "project:entities", ->
    API.getProjects()

  App.reqres.setHandler "project:entity", (id) ->
    API.getProject id

  App.reqres.setHandler "new:project:entity", ->
    API.newProject()
