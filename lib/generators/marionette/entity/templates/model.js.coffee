@<%= js_application_name %>.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.<%= model_name.classify %> extends Entities.Model
    initialize: ->
			@url = (if @id then "/<%= model_name.pluralize %>/" + @id else "/<%= model_name.pluralize %>")
		