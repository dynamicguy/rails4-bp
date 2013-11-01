@Rails4Bp.module "CountriesApp.New", (New, App, Backbone, Marionette, $, _) ->
	class New.Country extends App.Views.ItemView
		template: "countries/new/new_country"
