@Rails4Bp.module "CountriesApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends App.Controllers.Base
  
    initialize: (options) ->
      { country, id } = options
      country or= App.request "country:entity", id

      App.execute "when:fetched", country, =>
        @layout = @getLayoutView country
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @countryRegion country
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    countryRegion: (country) ->
      showView = @getShowView country
      @layout.countryRegion.show showView

    getLayoutView: (country) ->
      new Show.Layout
        model: country

    getShowView: (country) ->
      new Show.Country
        model: country

    getBreadcrumbView: ->
      new Show.Breadcrumb

    getSidebarView: ->
      new Show.Sidebar
