@Rails4Bp.module "CountriesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { country, id } = options
      country = App.request "country:entity", id
      @listenTo country, "updated", ->
        App.vent.trigger "country:updated", country
      App.execute "when:fetched", country, =>
        @layout = @getLayoutView country
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion country
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (country) ->
      editView = @getEditView country
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "country:cancelled", country
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (country) ->
      new Edit.Layout
        model: country

    getEditView: (country) ->
      new Edit.Country
        model: country

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar    