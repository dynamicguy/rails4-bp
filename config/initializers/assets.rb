Rails4Bp::Application.configure do
  config.serve_static_assets = AppConfig.environment.assets.serve?
  config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
  # config.static_cache_control = "public, max-age=3600" if AppConfig[:serve_static_assets].to_s == 'true'
end
