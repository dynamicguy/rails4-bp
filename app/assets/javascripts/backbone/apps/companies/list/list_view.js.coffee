@Rails4Bp.module "CompaniesApp.List", (List, App, Backbone, Marionette, $, _) ->

    class List.Layout extends App.Views.Layout
        template: "companies/list/list_layout"
        regions:
            panelRegion: "#panel-region"
            newRegion: "#new-region"
            listRegion: "#list-region"
            breadcrumbRegion: "#breadcrumb-region"
            sidebarRegion: "#sidebar-region"

    class List.Breadcrumb extends App.Views.ItemView
        template: "companies/list/_breadcrumb"

    class List.Sidebar extends App.Views.ItemView
        template: "companies/list/_sidebar"

    class List.Panel extends App.Views.ItemView
        template: "companies/list/_panel"
        className: 'row'
        triggers:
            "click #new-company": "new:company:button:clicked"

    class List.ListView extends App.Views.CompositeView
        template: "companies/list/list_company"
        id: "companyList"
        onRender: ->
            if @model
                $('#found_count').text(@model.collection.state.totalRecords)


    class List.Add extends App.Views.ItemView
        template: "companies/list/new_company"
        tagName: "li"
        className: "new-company media list-group-item"
        triggers:
            "click": "new:company:clicked"

