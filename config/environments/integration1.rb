require Rails.root.join('config', 'environment', 'development')

Rails4Bp::Application.configure do
  # Enable threaded mode
  config.threadsafe!
end
