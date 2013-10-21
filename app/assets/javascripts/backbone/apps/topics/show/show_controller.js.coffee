@Rails4Bp.module "TopicsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends App.Controllers.Base
  
    initialize: (options) ->
      { topic, id } = options
      topic or= App.request "topic:entity", id

      App.execute "when:fetched", topic, =>
        @layout = @getLayoutView topic
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @topicRegion topic
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    topicRegion: (topic) ->
      showView = @getShowView topic
      @layout.topicRegion.show showView

    getLayoutView: (topic) ->
      new Show.Layout
        model: topic

    getShowView: (topic) ->
      new Show.Topic
        model: topic

    getBreadcrumbView: ->
      new Show.Breadcrumb

    getSidebarView: ->
      new Show.Sidebar
