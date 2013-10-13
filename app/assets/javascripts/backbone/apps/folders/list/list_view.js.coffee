@Rails4Bp.module "FoldersApp.List", (List, App, Backbone, Marionette, $, _) ->

    class List.Layout extends App.Views.Layout
        template: "folders/list/list_layout"
        regions:
            panelRegion: "#panel-region"
            newRegion: "#new-region"
            listRegion: "#list-region"
            breadcrumbRegion: "#breadcrumb-region"
            sidebarRegion: "#sidebar-region"

    class List.Breadcrumb extends App.Views.ItemView
        template: "folders/list/_breadcrumb"

    class List.Sidebar extends App.Views.ItemView
        template: "folders/list/_sidebar"

    class List.Panel extends App.Views.ItemView
        template: "folders/list/_panel"
        className: 'row'
        triggers:
            "click #new-folder": "new:folder:button:clicked"

    class List.ListView extends App.Views.CompositeView
        template: "folders/list/list_folder"
        id: "folderList"
        onRender: ->
            if @model
                $('#found_count').text(@model.collection.state.totalRecords)


    class List.Add extends App.Views.ItemView
        template: "folders/list/new_folder"
        tagName: "li"
        className: "new-folder media list-group-item"
        triggers:
            "click": "new:folder:clicked"

