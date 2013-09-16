@Rails4Bp.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "users/list/list_layout"

    regions:
      fooRegion: "#foo-region"