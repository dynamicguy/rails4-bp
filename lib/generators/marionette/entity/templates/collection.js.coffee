
  class Entities.<%= model_name.classify.pluralize %>Collection extends App.Entities.PageableCollection
    model: Entities.<%= model_name.classify %>
    url: -> <%= Rails.configuration.marionette[:js_routes] ? "Routes.#{model_name.pluralize}_path()" : "'/#{model_name.pluralize}'" %>
    queryParams:
			sortKey: "order"
			order: "dir"
			directions:
				"-1": "asc"
				1: "desc"
		state:
			pageSize: 20
			sortKey: "id"
			order: 1
