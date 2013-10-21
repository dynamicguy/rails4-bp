@Rails4Bp.module "TopicsApp", (TopicsApp, App, Backbone, Marionette, $, _) ->

	class TopicsApp.Router extends Marionette.AppRouter
		appRoutes:
			"topics/:id": "show"
			"topics/:id/edit": "edit"
			"topics": "list"

	API =
                    		            
		show: (id, topic) ->
			new TopicsApp.Show.Controller
				id: id
				topic: topic
            		            
		edit: (id, topic) ->
			new TopicsApp.Edit.Controller
				id: id
				topic: topic
            		            		
		newTopic: (region) ->
			new TopicsApp.New.Controller
				region: region

		list: ->
			new TopicsApp.List.Controller


	App.commands.setHandler "new:topic", (region) ->
		API.newTopic region

	App.vent.on "topic:clicked topic:created", (topic) ->
		App.navigate Routes.edit_topic_path(topic.id)
		API.edit topic.id, topic

	App.vent.on "topic:cancelled topic:updated", (topic) ->
		App.navigate Routes.topics_path()
		API.list()
	
	App.addInitializer ->
		new TopicsApp.Router
			controller: API
	