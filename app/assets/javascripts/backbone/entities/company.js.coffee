@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Company extends Entities.Model
    idAttribute: 'comp_id'
    initialize: ->
      @url = (if @id then "/companies/" + @id else "/companies")

  class Entities.CompaniesCollection extends App.Entities.PageableCollection
    model: Entities.Company
    url: ->
      Routes.companies_path()

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
    getCompanies: ->
      companies = new Entities.CompaniesCollection
      companies.fetch
        reset: true
      companies

    getCompany: (id) ->
      company = new Entities.Company
        comp_id: id
      company.fetch()
      company

    newCompany: ->
      new Entities.Company

  App.reqres.setHandler "company:entities", ->
    API.getCompanies()

  App.reqres.setHandler "company:entity", (id) ->
    API.getCompany id

  App.reqres.setHandler "new:company:entity", ->
    API.newCompany()
