@Rails4Bp.module "ProjectsApp", (ProjectsApp, App, Backbone, Marionette, $, _) ->

	class ProjectsApp.Router extends Marionette.AppRouter
		appRoutes:
			"projects/:id": "show"
			"projects/:id/edit": "edit"
			"projects": "list"

	API =
                    		            
		show: (id, project) ->
			new ProjectsApp.Show.Controller
				id: id
				project: project
            		            
		edit: (id, project) ->
			new ProjectsApp.Edit.Controller
				id: id
				project: project
            		            		
		newProject: (region) ->
			new ProjectsApp.New.Controller
				region: region

		list: ->
			new ProjectsApp.List.Controller


	App.commands.setHandler "new:project", (region) ->
		API.newProject region

	App.vent.on "project:clicked project:created", (project) ->
		App.navigate Routes.edit_project_path(project.id)
		API.edit project.id, project

	App.vent.on "project:cancelled project:updated", (project) ->
		App.navigate Routes.projects_path()
		API.list()
	
	App.addInitializer ->
		new ProjectsApp.Router
			controller: API
	