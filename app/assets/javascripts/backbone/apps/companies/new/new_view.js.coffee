@Rails4Bp.module "CompaniesApp.New", (New, App, Backbone, Marionette, $, _) ->
  class New.Company extends App.Views.ItemView
    template: "companies/new/new_company"
