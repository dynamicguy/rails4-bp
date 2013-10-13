@Rails4Bp.module "CitiesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { city, id } = options
      city = App.request "city:entity", id
      @listenTo city, "updated", ->
        App.vent.trigger "city:updated", city
      App.execute "when:fetched", city, =>
        @layout = @getLayoutView city
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion city
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (city) ->
      editView = @getEditView city
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "city:cancelled", city
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (city) ->
      new Edit.Layout
        model: city

    getEditView: (city) ->
      new Edit.City
        model: city

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar
