@Rails4Bp.module "FoldersApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends App.Views.Layout
    template: "folders/show/show_layout"
    events:
      "click .crew-delete": "deleteRow"
    deleteRow: (e) ->
      e.preventDefault() # stop the hash being added to the URL
      Rails4Bp.Notify.confirm(@model)
    regions:
      breadcrumbRegion: "#breadcrumb-region"
      sidebarRegion: "#sidebar-region"
      folderRegion: "#folder-region"

  class Show.Breadcrumb extends App.Views.ItemView
    template: "folders/show/_breadcrumb"

  class Show.Sidebar extends App.Views.ItemView
    template: "folders/show/_sidebar"

  class Show.Folder extends App.Views.ItemView
    template: "folders/show/show_folder"

