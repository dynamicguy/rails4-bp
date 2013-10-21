@Rails4Bp.module "TopicsApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base
    initialize: ->
    	topic = App.request "new:topic:entity"
    	@listenTo topic, "created", ->
    		App.vent.trigger "topic:created", topic
    	newView = @getNewView topic
    	formView = App.request "form:wrapper", newView
    	@listenTo newView, "form:cancel", =>
    		@region.close()
    	@show formView

    getNewView: (topic) ->
    	new New.Topic
    		model: topic
