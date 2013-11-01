Sidekiq.configure_server do |config|
  config.redis = AppConfig.get_redis_options
end

Sidekiq.configure_client do |config|
  config.redis = AppConfig.get_redis_options
end
