@Rails4Bp.module "PagesApp.List", (List, App, Backbone, Marionette, $, _) ->

    class List.Layout extends App.Views.Layout
        template: "pages/list/list_layout"
        regions:
            panelRegion: "#panel-region"
            newRegion: "#new-region"
            listRegion: "#list-region"
            breadcrumbRegion: "#breadcrumb-region"
            sidebarRegion: "#sidebar-region"

    class List.Breadcrumb extends App.Views.ItemView
        template: "pages/list/_breadcrumb"

    class List.Sidebar extends App.Views.ItemView
        template: "pages/list/_sidebar"

    class List.Panel extends App.Views.ItemView
        template: "pages/list/_panel"
        className: 'row'
        triggers:
            "click #new-page": "new:page:button:clicked"

    class List.ListView extends App.Views.CompositeView
        template: "pages/list/list_page"
        id: "pageList"
        onRender: ->
            if @model
                $('#found_count').text(@model.collection.state.totalRecords)


    class List.Add extends App.Views.ItemView
        template: "pages/list/new_page"
        tagName: "li"
        className: "new-page media list-group-item"
        triggers:
            "click": "new:page:clicked"

