@Rails4Bp.module "TopicsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "topics/show/show_layout"
		events:
			"click .crew-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault() # stop the hash being added to the URL
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			topicRegion: "#topic-region"

	class Show.Breadcrumb extends App.Views.ItemView
	  template: "topics/show/_breadcrumb"

	class Show.Sidebar extends App.Views.ItemView
	  template: "topics/show/_sidebar"

	class Show.Topic extends App.Views.ItemView
		template: "topics/show/show_topic"

