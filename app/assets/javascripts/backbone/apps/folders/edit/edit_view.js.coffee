@Rails4Bp.module "FoldersApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "folders/edit/edit_layout"
		events:
			"click .folder-delete": "deleteRow"
		deleteRow: (e) ->
			e.preventDefault()
			Rails4Bp.Notify.confirm(@model)
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			formRegion: "#form-region"

	class Edit.Breadcrumb extends App.Views.ItemView
		template: "folders/edit/_breadcrumb"

	class Edit.Sidebar extends App.Views.ItemView
		template: "folders/edit/_sidebar"

	class Edit.Folder extends App.Views.ItemView
		template: "folders/edit/edit_folder"
