@Rails4Bp.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "header/list/list_layout"
		className: 'container-fluid'

		regions:
			headerRegion: "#nav-region"
			titleRegion: "#title-region"

	class List.Title extends App.Views.ItemView
		template: "header/list/_title"
		className: 'container'


	class List.Notice extends App.Views.ItemView
		template: "header/list/_notice"
		className: 'container'

	class List.Header extends App.Views.ItemView
		template: "header/list/header"


