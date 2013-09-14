@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Crew extends App.Entities.Model
		urlRoot: -> Routes.crews_path()
	
	class Entities.CrewCollection extends App.Entities.Collection
		model: Entities.Crew
		
		url: -> Routes.crews_path()
	
	API =
		getCrew: ->
			crew = new Entities.CrewCollection
			crew.fetch
				reset: true
			crew
		
		getCrewMember: (id) ->
			member = new Entities.Crew
				id: id
			member.fetch()
			member
		
		newCrewMember: ->
			new Entities.Crew
	
	App.reqres.setHandler "crew:entities", ->
		API.getCrew()
	
	App.reqres.setHandler "crew:entity", (id) ->
		API.getCrewMember id
	
	App.reqres.setHandler "new:crew:entity", ->
		API.newCrewMember()