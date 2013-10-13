@Rails4Bp.module "CompaniesApp", (CompaniesApp, App, Backbone, Marionette, $, _) ->
  class CompaniesApp.Router extends Marionette.AppRouter
    appRoutes:
      "companies/:id": "show"
      "companies/:id/edit": "edit"
      "companies": "list"

  API =
    show: (id, company) ->
      new CompaniesApp.Show.Controller
        id: id
        company: company

    edit: (id, company) ->
      new CompaniesApp.Edit.Controller
        id: id
        company: company

    newCompany: (region) ->
      new CompaniesApp.New.Controller
        region: region

    list: ->
      new CompaniesApp.List.Controller


  App.commands.setHandler "new:company", (region) ->
    API.newCompany region

  App.vent.on "company:clicked company:created", (company) ->
    App.navigate Routes.edit_company_path(company.id)
    API.edit company.id, company

  App.vent.on "company:cancelled company:updated", (company) ->
    App.navigate Routes.companies_path()
    API.list()

  App.addInitializer ->
    new CompaniesApp.Router
      controller: API
