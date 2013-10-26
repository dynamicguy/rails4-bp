set :rails_env, "production"

set :application, '162.209.48.170'
role :app, application
role :web, application
role :db, application, :primary => true
