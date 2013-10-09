@Rails4Bp.module "CitiesApp.New", (New, App, Backbone, Marionette, $, _) ->
	class New.Controller extends App.Controllers.Base

		initialize: ->
			city = App.request "new:city:entity"
			@listenTo city, "created", ->
				App.vent.trigger "city:created", city
			newView = @getNewView city
			formView = App.request "form:wrapper", newView
			@listenTo newView, "form:cancel", =>
				@region.close()
			@show formView

		getNewView: (city) ->
			new New.City
				model: city