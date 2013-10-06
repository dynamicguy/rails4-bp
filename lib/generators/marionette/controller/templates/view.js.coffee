@<%= js_application_name %>.module "<%= module_name_class %>.<%= @controller %>", (<%= @controller %>, App, Backbone, Marionette, $, _) ->

	class <%= @controller %>.Layout extends <%= Rails.configuration.marionette[:base_views] ? "App.Views.Layout" : "Marionette.Layout" %>
		template: "<%= view_template_path %>"
		regions:
			breadcrumbRegion: "#breadcrumb-region"
			sidebarRegion: "#sidebar-region"
			newRegion: "#new-region"
			contentRegion: "#content-region"

	class <%= @controller %>.Breadcrumb extends App.Views.ItemView
	  template: "<%= view_base_template_path %>/_breadcrumb"

	class <%= @controller %>.Sidebar extends App.Views.ItemView
	  template: "<%= view_base_template_path %>/_sidebar"
