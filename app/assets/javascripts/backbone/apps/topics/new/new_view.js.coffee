@Rails4Bp.module "TopicsApp.New", (New, App, Backbone, Marionette, $, _) ->
	class New.Topic extends App.Views.ItemView
		template: "topics/new/new_topic"
