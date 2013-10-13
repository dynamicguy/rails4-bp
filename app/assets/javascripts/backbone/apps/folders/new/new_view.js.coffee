@Rails4Bp.module "FoldersApp.New", (New, App, Backbone, Marionette, $, _) ->
  class New.Folder extends App.Views.ItemView
    template: "folders/new/new_folder"
