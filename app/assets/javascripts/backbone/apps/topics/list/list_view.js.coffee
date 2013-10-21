@Rails4Bp.module "TopicsApp.List", (List, App, Backbone, Marionette, $, _) ->

    class List.Layout extends App.Views.Layout
        template: "topics/list/list_layout"
        regions:
            panelRegion: "#panel-region"
            newRegion: "#new-region"
            listRegion: "#list-region"
            breadcrumbRegion: "#breadcrumb-region"
            sidebarRegion: "#sidebar-region"

    class List.Breadcrumb extends App.Views.ItemView
        template: "topics/list/_breadcrumb"

    class List.Sidebar extends App.Views.ItemView
        template: "topics/list/_sidebar"

    class List.Panel extends App.Views.ItemView
        template: "topics/list/_panel"
        className: 'row'
        triggers:
            "click #new-topic": "new:topic:button:clicked"

    class List.ListView extends App.Views.CompositeView
        template: "topics/list/list_topic"
        id: "topicList"
        onRender: ->
            if @model
                $('#found_count').text(@model.collection.state.totalRecords)


    class List.Add extends App.Views.ItemView
        template: "topics/list/new_topic"
        tagName: "li"
        className: "new-topic media list-group-item"
        triggers:
            "click": "new:topic:clicked"

