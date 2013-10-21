@Rails4Bp.module "TopicsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "topics/edit/edit_layout"
		events:
			"click .topic-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault()
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: "#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "topics/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "topics/edit/_sidebar"

	class Edit.Topic extends App.Views.ItemView
		template: "topics/edit/edit_topic"
