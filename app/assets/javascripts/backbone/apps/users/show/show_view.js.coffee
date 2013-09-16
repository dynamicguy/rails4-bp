@Rails4Bp.module "UsersApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "users/show/show_layout"

    regions:
      fooRegion: "#foo-region"