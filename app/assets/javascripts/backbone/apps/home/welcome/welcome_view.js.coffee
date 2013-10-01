@Rails4Bp.module "HomeApp.Welcome", (Welcome, App, Backbone, Marionette, $, _) ->
	class Welcome.Layout extends App.Views.Layout
		template: "home/welcome/welcome_layout"

		regions:
			contentBlockRegion: "#content-block"