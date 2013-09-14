@Rails4Bp.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	class New.Crew extends App.Views.ItemView
		template: "crew/new/new_crew"
		
		form:
			buttons:
				placement: "left"