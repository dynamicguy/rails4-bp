@Rails4Bp.module "ProfilesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "profiles/show/show_layout"

    regions:
      fooRegion: "#foo-region"