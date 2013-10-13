@Rails4Bp.module "PagesApp.New", (New, App, Backbone, Marionette, $, _) ->
	class New.Page extends App.Views.ItemView
		template: "pages/new/new_page"
