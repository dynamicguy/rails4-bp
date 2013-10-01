class User
  include Rails.application.routes.url_helpers
  def default_url_options
    {:host => AppConfig.pod_uri.host}
  end
end
