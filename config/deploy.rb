require "bundler/capistrano"

default_run_options[:pty] = true
ssh_options[:forward_agent] = false

set :stages, %w(staging production)
set :default_stage, 'production'

require 'capistrano/ext/multistage'

set :application, "rails4bp"
set :repository,  "git@git.helpdocstest.com:helpiq-search/helpiq-search.git"

set :scm, :git
set :deploy_via, :remote_cache
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "162.209.48.170"                          # Your HTTP server, Apache/etc
role :app, "162.209.48.170"                          # This may be the same as your `Web` server
role :db,  "162.209.48.170", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, "deploy"
set :use_sudo, false

set :deploy_to, defer { "/u/apps/#{application}_#{stage}" }

before "deploy:finalize_update" do
  run "rm -f #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "mkdir -p #{release_path}/tmp"
  run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
end

namespace :deploy do
  task :start do
    run "sudo bluepill load /etc/bluepill/#{application}_#{stage}.pill"
  end
  task :stop do
    run "sudo bluepill #{application}_#{stage} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo bluepill #{application}_#{stage} restart"
  end
  task :status do
    run "sudo bluepill #{application}_#{stage} status"
  end
end
