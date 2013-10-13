@Rails4Bp.module "ProjectsApp.List", (List, App, Backbone, Marionette, $, _) ->

    class List.Layout extends App.Views.Layout
        template: "projects/list/list_layout"
        regions:
            panelRegion: "#panel-region"
            newRegion: "#new-region"
            listRegion: "#list-region"
            breadcrumbRegion: "#breadcrumb-region"
            sidebarRegion: "#sidebar-region"

    class List.Breadcrumb extends App.Views.ItemView
        template: "projects/list/_breadcrumb"

    class List.Sidebar extends App.Views.ItemView
        template: "projects/list/_sidebar"

    class List.Panel extends App.Views.ItemView
        template: "projects/list/_panel"
        className: 'row'
        triggers:
            "click #new-project": "new:project:button:clicked"

    class List.ListView extends App.Views.CompositeView
        template: "projects/list/list_project"
        id: "projectList"
        onRender: ->
            if @model
                $('#found_count').text(@model.collection.state.totalRecords)


    class List.Add extends App.Views.ItemView
        template: "projects/list/new_project"
        tagName: "li"
        className: "new-project media list-group-item"
        triggers:
            "click": "new:project:clicked"

