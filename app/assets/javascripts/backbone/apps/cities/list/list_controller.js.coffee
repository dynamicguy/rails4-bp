@Rails4Bp.module "CitiesApp.List", (List, App, Backbone, Marionette, $, _) ->
  class List.Controller extends App.Controllers.Base

    initialize: ->
      cities = App.request "city:entities"
      App.execute "when:fetched", cities, =>
        @layout = @getLayoutView cities
        @listenTo @layout, "close", @close
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @panelRegion()
          @listRegion cities
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    panelRegion: ->
      panelView = @getPanelView()
      @listenTo panelView, "new:city:button:clicked", =>
        @newRegion()
      @layout.panelRegion.show panelView

    newRegion: ->
      App.execute "new:city", @layout.newRegion

    listRegion: (cities) ->
      listView = @getListView cities
      @listenTo listView, "childview:city:clicked", (child, args) ->
        App.vent.trigger "city:clicked", child.model
      @layout.listRegion.show listView

      ActionsCell = Backgrid.Cell.extend(
        className: 'actions'
        template: _.template("<a href='#cities/<%= id %>' class='btn btn-default btn-xs'><span class='glyphicon glyphicon-eye-open'></span></a> <a href='#cities/<%= id %>/edit' class='btn city-edit btn-default btn-xs'><span class='glyphicon glyphicon-pencil'></span> </a> <button data-id='<%= id %>' class='city-delete btn btn-danger btn-xs' data-type='confirm'><span class='glyphicon glyphicon-trash'></span></button>")
        events:
          "click .city-delete": "deleteRow"
        deleteRow: (e) ->
          e.preventDefault()
          Rails4Bp.Notify.confirm(@model)
        render: ->
          @$el.html @template({id: @model.id})
          @delegateEvents()
          @
      )

      columns = [
        name: "name"
        cell: "string"
        editable: false
      ,
        name: "population"
        cell: "number"
        editable: false
      ,
        name: "countrycode"
        cell: "string"
        editable: false
      ,
        name: "district"
        cell: "string"
        editable: false
      ,
        name: "id"
        label: "Actions"
        sortable: false
        editable: false
        cell: ActionsCell
      ]

      if listView.hasOwnProperty 'collection'
        grid = new Backgrid.Grid
          className: "backgrid table table-striped table-bordered table-hover"
          collection: listView.collection
          columns: columns

        $("#grid").append(grid.render().$el)
        $("thead tr").addClass("warning")

        class Paginator extends Backgrid.Extension.Paginator
          template: _.template('<ul class="pagination"><% _.each(handles, function (handle) { %><li <% if (handle.className) { %>class="<%= handle.className %>"<% } %>><a href="#" <% if (handle.title) {%> title="<%= handle.title %>"<% } %>><%= handle.label %></a></li><% }); %></ul>')
          columns: columns
          collection: listView.collection
          className: 'backgrid-paginator'

        paginator = new Paginator(
          columns: columns
          collection: listView.collection
        )
        $("#paginator").append paginator.render().$el

        class Filter extends Backgrid.Extension.ServerSideFilter
          template: _.template('<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input autocomplete="off" class="form-control h35" type="text" <% if (placeholder) { %> placeholder="<%- placeholder %>" <% } %> name="<%- name %>" /><span class="input-group-addon"><a class="close" href="#">&times;</a></span></div>')
          className: 'backgrid-filter form-search'
          placeholder: "Search"
          collection: listView.collection

        filter = new Filter(
          collection: listView.collection
          fields: ["name", "population", "countrycode", "district"]
        )
        $("#filters").append filter.render().$el
        started_at = Date.now()
        listView.collection.fetch(reset: true)
        $('#elapsed_time').text((Date.now() - started_at) / 1000)


    getBreadcrumbView: ->
      new List.Breadcrumb

    getSidebarView: ->
      new List.Sidebar

    getListView: (cities) ->
      new List.ListView
        collection: cities

    getPanelView: ->
      new List.Panel

    getLayoutView: (cities) ->
      new List.Layout
        collection: cities

