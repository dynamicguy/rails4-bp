Rails4Bp::Application.configure do
  config.marionette = {}

  ## client side marionette application instance name
  config.marionette[:app_name] = 'Rails4Bp'

  ## are we using js-routes for url and urlRoot properties on entities?
  config.marionette[:js_routes] = true

  ## whether we're using base views to extend from
  config.marionette[:base_views] = true
end