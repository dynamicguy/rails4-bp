@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Topic extends Entities.Model
    idAttribute: 'topic_id'
    initialize: ->
      @url = (if @id then "/topics/" + @id else "/topics")

  class Entities.TopicsCollection extends App.Entities.PageableCollection
    model: Entities.Topic
    url: ->
      Routes.topics_path()
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
    getTopics: ->
      topics = new Entities.TopicsCollection
      topics.fetch
        reset: true
      topics

    getTopic: (id) ->
      topic = new Entities.Topic
        topic_id: id
      topic.fetch()
      topic

    newTopic: ->
      new Entities.Topic

  App.reqres.setHandler "topic:entities", ->
    API.getTopics()

  App.reqres.setHandler "topic:entity", (id) ->
    API.getTopic id

  App.reqres.setHandler "new:topic:entity", ->
    API.newTopic()
