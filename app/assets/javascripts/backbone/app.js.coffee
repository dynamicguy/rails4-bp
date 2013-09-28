@Rails4Bp = do (Backbone, Marionette) ->
	
	App = new Marionette.Application

	App.on "initialize:before", (options) ->
		App.environment = options.environment
		@currentUser = App.request "set:current:user", options.currentUser

	App.reqres.setHandler "get:current:user", ->
		App.currentUser
	
	App.addRegions
		headerRegion: "#header-region"
		mainRegion:		"#main-region"
		footerRegion: "#footer-region"
	
	App.rootRoute = Routes.root_path()
	
	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()
	
	App.reqres.setHandler "default:region", ->
		App.mainRegion
	
	App.commands.setHandler "register:instance", (instance, id) ->
		App.register instance, id if App.environment is "development"
	
	App.commands.setHandler "unregister:instance", (instance, id) ->
		App.unregister instance, id if App.environment is "development"
	
	App.on "initialize:after", ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()
	
	App