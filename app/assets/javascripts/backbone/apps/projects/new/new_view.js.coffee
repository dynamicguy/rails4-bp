@Rails4Bp.module "ProjectsApp.New", (New, App, Backbone, Marionette, $, _) ->
	class New.Project extends App.Views.ItemView
		template: "projects/new/new_project"
