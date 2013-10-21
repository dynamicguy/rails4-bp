@Rails4Bp.module "TopicsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { topic, id } = options
      topic = App.request "topic:entity", id
      @listenTo topic, "updated", ->
        App.vent.trigger "topic:updated", topic
      App.execute "when:fetched", topic, =>
        @layout = @getLayoutView topic
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @formRegion topic
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    formRegion: (topic) ->
      editView = @getEditView topic
      @listenTo editView, "form:cancel", ->
        App.vent.trigger "topic:cancelled", topic
      formView = App.request "form:wrapper", editView
      @layout.formRegion.show formView

    getLayoutView: (topic) ->
      new Edit.Layout
        model: topic

    getEditView: (topic) ->
      new Edit.Topic
        model: topic

    getBreadcrumbView: ->
      new Edit.Breadcrumb

    getSidebarView: ->
      new Edit.Sidebar    