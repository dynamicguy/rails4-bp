set :rails_env, "staging"
set :application, '162.209.48.170'
role :app, application
role :web, application
role :db,  application, :primary => true
