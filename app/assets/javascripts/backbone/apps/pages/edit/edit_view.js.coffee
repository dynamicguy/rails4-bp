@Rails4Bp.module "PagesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "pages/edit/edit_layout"
    events:
      "click .page-delete": "deleteRow"
    deleteRow: (e) ->
      e.preventDefault()
      Rails4Bp.Notify.confirm(@model)
    regions:
      breadcrumbRegion: "#breadcrumb-region"
      sidebarRegion: "#sidebar-region"
      formRegion: "#form-region"

  class Edit.Breadcrumb extends App.Views.ItemView
    template: "pages/edit/_breadcrumb"

  class Edit.Sidebar extends App.Views.ItemView
    template: "pages/edit/_sidebar"

  class Edit.Page extends App.Views.ItemView
    template: "pages/edit/edit_page"
