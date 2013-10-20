@Rails4Bp.module "CompaniesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { company, id } = options
      company = App.request "company:entity", id
      @listenTo company, "updated", ->
        App.vent.trigger "company:updated", company
      App.execute "when:fetched", company, =>
        @layout = @getLayoutView company
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion company
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (company) ->
      editView = @getEditView company
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "company:cancelled", company
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (company) ->
      new Edit.Layout
        model: company

    getEditView: (company) ->
      new Edit.Company
        model: company

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar    
