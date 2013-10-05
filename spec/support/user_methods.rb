class User
  include Rails.application.routes.url_helpers
  def default_url_options
    {:host => AppConfig.app_uri.host}
  end
end
