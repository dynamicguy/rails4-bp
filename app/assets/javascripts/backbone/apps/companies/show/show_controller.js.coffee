@Rails4Bp.module "CompaniesApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends App.Controllers.Base
  
    initialize: (options) ->
      { company, id } = options
      company or= App.request "company:entity", id

      App.execute "when:fetched", company, =>
        @layout = @getLayoutView company
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @companyRegion company
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    companyRegion: (company) ->
      showView = @getShowView company
      @layout.companyRegion.show showView

    getLayoutView: (company) ->
      new Show.Layout
        model: company

    getShowView: (company) ->
      new Show.Company
        model: company

    getBreadcrumbView: ->
      new Show.Breadcrumb

    getSidebarView: ->
      new Show.Sidebar
