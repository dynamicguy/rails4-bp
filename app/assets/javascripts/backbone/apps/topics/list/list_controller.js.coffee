@Rails4Bp.module "TopicsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      topics = App.request "topic:entities"
      App.execute "when:fetched", topics, =>
        @layout = @getLayoutView topics
        @listenTo @layout, "close", @close
        @listenTo @layout, "show", =>
          @breadcrumbRegion()
          @sidebarRegion()
          @panelRegion()
          @listRegion topics
        @show @layout

    breadcrumbRegion: ->
      breadcrumbView = @getBreadcrumbView()
      @layout.breadcrumbRegion.show breadcrumbView

    sidebarRegion: ->
      sidebarView = @getSidebarView()
      @layout.sidebarRegion.show sidebarView

    panelRegion: ->
      panelView = @getPanelView()
      @listenTo panelView, "new:topic:button:clicked", =>
        @newRegion()
      @layout.panelRegion.show panelView

    newRegion: ->
      App.execute "new:topic", @layout.newRegion

    listRegion: (topics) ->
      listView = @getListView topics
      @listenTo listView, "childview:topic:clicked", (child, args) ->
        App.vent.trigger "topic:clicked", child.model
      @layout.listRegion.show listView

      ActionsCell = Backgrid.Cell.extend(
        className: 'actions'
        template: _.template("<a href='#topics/<%= id %>' class='btn btn-default btn-xs'><span class='glyphicon glyphicon-eye-open'></span></a> <a href='#topics/<%= id %>/edit' class='btn topic-edit btn-default btn-xs'><span class='glyphicon glyphicon-pencil'></span> </a> <button data-id='<%= id %>' class='topic-delete btn btn-danger btn-xs' data-type='confirm'><span class='glyphicon glyphicon-trash'></span></button>")
        events:
          "click .topic-delete": "deleteRow"
        deleteRow: (e) ->
          e.preventDefault()
          Rails4Bp.Notify.confirm(@model)
        render: ->
          @$el.html @template({id: @model.id})
          @delegateEvents()
          @
      )

      columns = [
        name: "topic_title"
        label: "title"
        cell: "string"
        editable: false
      ,
        name: "toc_name"
        label: "name"
        cell: "string"
        editable: false
      ,
        name: "topic_permalink"
        label: "permalink"
        cell: "string"
        editable: false
      ,
        name: "topic_id"
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
          fields: ["topic_title", "toc_name", "topic_permalink"]
        )
        $("#filters").append filter.render().$el
        started_at = Date.now()
        listView.collection.fetch(reset: true)
        $('#elapsed_time').text((Date.now() - started_at) / 1000)


    getBreadcrumbView: ->
      new List.Breadcrumb

    getSidebarView: ->
      new List.Sidebar

    getListView: (topics) ->
      new List.ListView
        collection: topics

    getPanelView: ->
      new List.Panel

    getLayoutView: (topics) ->
      new List.Layout
        collection: topics
