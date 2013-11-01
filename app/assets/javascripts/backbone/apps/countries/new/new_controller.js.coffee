@Rails4Bp.module "CountriesApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base
    initialize: ->
    	country = App.request "new:country:entity"
    	@listenTo country, "created", ->
    		App.vent.trigger "country:created", country
    	newView = @getNewView country
    	formView = App.request "form:wrapper", newView
    	@listenTo newView, "form:cancel", =>
    		@region.close()
    	@show formView

    getNewView: (country) ->
    	new New.Country
    		model: country
