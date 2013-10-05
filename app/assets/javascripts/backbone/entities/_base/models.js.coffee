@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	class Entities.Model extends Backbone.Model
		destroy: (options = {}) ->
			_.defaults options,
				wait: true

			@set _destroy: true
			super options
			Rails4Bp.Notify.show("success","item with ID \"#{@.get('id')}\" has been destroyed successfully.","bottomRight")

		isDestroyed: ->
			@get "_destroy"

		save: (data, options = {}) ->
			isNew = @isNew()

			_.defaults options,
				wait: true
				success: _.bind(@saveSuccess, @, isNew, options.collection)
				error: _.bind(@saveError, @)

			@unset "_errors"
			super data, options

		saveSuccess: (isNew, collection) =>
			if isNew ## model is being created
				collection.add @ if collection
				collection.trigger "model:created", @ if collection
				@trigger "created", @
				Rails4Bp.Notify.show("success","item with ID \"#{@.get('id')}\" has been created successfully.","bottomRight")
			else ## model is being updated
				collection ?= @collection ## if model has collection property defined, use that if no collection option exists
				collection.trigger "model:updated", @ if collection
				@trigger "updated", @
				Rails4Bp.Notify.show("success","item with ID \"#{@.get('id')}\" has been saved successfully.","bottomRight")

		saveError: (model, xhr, options) =>
			## set errors directly on the model unless status returned was 500 or 404
			@set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404
			Rails4Bp.Notify.show("error","Something went wrong while saving row with ID \"#{@.get('id')}\". Please try again.","bottomRight")