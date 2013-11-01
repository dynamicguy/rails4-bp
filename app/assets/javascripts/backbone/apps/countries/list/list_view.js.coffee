@Rails4Bp.module "CountriesApp.List", (List, App, Backbone, Marionette, $, _) ->

    class List.Layout extends App.Views.Layout
        template: "countries/list/list_layout"
        regions:
            panelRegion: "#panel-region"
            newRegion: "#new-region"
            listRegion: "#list-region"
            breadcrumbRegion: "#breadcrumb-region"
            sidebarRegion: "#sidebar-region"

    class List.Breadcrumb extends App.Views.ItemView
        template: "countries/list/_breadcrumb"

    class List.Sidebar extends App.Views.ItemView
        template: "countries/list/_sidebar"

    class List.Panel extends App.Views.ItemView
        template: "countries/list/_panel"
        className: 'row'
        triggers:
            "click #new-country": "new:country:button:clicked"

    class List.ListView extends App.Views.CompositeView
        template: "countries/list/list_country"
        id: "countryList"
        onRender: ->
            Rails4Bp.Common.loadListBindings()
            if @model
                $('#found_count').text(@model.collection.state.totalRecords)


    class List.Add extends App.Views.ItemView
        template: "countries/list/new_country"
        tagName: "li"
        className: "new-country media list-group-item"
        triggers:
            "click": "new:country:clicked"

