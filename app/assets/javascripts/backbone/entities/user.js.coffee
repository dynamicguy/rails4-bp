@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	class Entities.User extends Entities.Model
		urlRoot: ->
			Routes.users_path()

	class Entities.UsersCollection extends Entities.Collection
		model: Entities.User
		url: ->
			Routes.users_path()

	API =
		setCurrentUser: (currentUser) ->
			new Entities.User currentUser

		getUsers: ->
			users = new Entities.UsersCollection
			users.fetch
				reset: true
			users

		getUser: (id) ->
			user = new Entities.User
				id: id
			user.fetch()
			user

		newUser: ->
			new Entities.User

	App.reqres.setHandler "user:entities", ->
		API.getUsers()

	App.reqres.setHandler "user:entity", (id) ->
		API.getUser id

	App.reqres.setHandler "new:user:entity", ->
		API.newUser()

	App.reqres.setHandler "set:current:user", (currentUser) ->
		API.setCurrentUser currentUser
