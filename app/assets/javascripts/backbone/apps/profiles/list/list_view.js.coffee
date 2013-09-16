@Rails4Bp.module "ProfilesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "profiles/list/list_layout"

    regions:
      fooRegion: "#foo-region"