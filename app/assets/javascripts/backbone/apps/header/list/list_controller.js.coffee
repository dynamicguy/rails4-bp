@Rails4Bp.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: ->
			@layout = @getLayoutView()
			@listenTo @layout, "show", =>
				@titleRegion()
				@noticeRegion()
				@headerRegion()

			@show @layout


		titleRegion: ->
			titleView = @getTitleView()
			@layout.titleRegion.show titleView

		noticeRegion: ->
			noticeView = @getNoticeView()
			@layout.noticeRegion.show noticeView

		headerRegion: ->
			headerView = @getHeaderView()
			@layout.headerRegion.show headerView

		getLayoutView: ->
			new List.Layout

		getTitleView: ->
			new List.Title

		getNoticeView: ->
			new List.Notice

		getHeaderView: ->
			new List.Header

