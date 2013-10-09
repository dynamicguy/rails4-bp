@Rails4Bp.module "CitiesApp.New", (New, App, Backbone, Marionette, $, _) ->
	class New.City extends App.Views.ItemView
		template: "cities/new/new_city"