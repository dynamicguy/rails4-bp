require "bundler/capistrano"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :stages, %w(staging production)
set :default_stage, 'staging'

require 'capistrano/ext/multistage'

set :application, "rails4bp"
set :repository, "git@git.helpdocstest.com:helpiq-search/helpiq-search.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "162.209.48.170" # Your HTTP server, Apache/etc
role :app, "162.209.48.170" # This may be the same as your `Web` server
role :db, "162.209.48.170", :primary => true # This is where Rails migrations will run
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
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "sudo bluepill #{application}_#{stage} restart"
  end
  task :status do
    run "sudo bluepill #{application}_#{stage} status"
  end
end


#require "bundler/capistrano"
#require 'capistrano/ext/multistage'
##require 'puma/capistrano'
#
#set :stages, %w(staging production)
#set :default_stage, 'production'
#
#set :application, 'rails4bp'
#set :deploy_via, :remote_cache
#
#default_run_options[:pty] = true
#ssh_options[:forward_agent] = false
#
#set :repository, "git@git.helpdocstest.com:helpiq-search/helpiq-search.git"
#set :scm, :git
#
#role :app, '162.209.48.170'
#role :web, '162.209.48.170'
#role :db, '162.209.48.170', :primary => true
#
#set :user, "deploy"
#set :use_sudo, false
#
#set :deploy_to, defer { "/u/apps/#{application}_#{stage}" }
#
#before "deploy:finalize_update" do
#  run "rm -f #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#  run "mkdir -p #{release_path}/tmp"
#  run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
#end
#
#namespace :deploy do
#  task :start do
#    run "sudo bluepill load /etc/bluepill/#{application}_#{stage}.pill"
#  end
#  task :stop do
#    run "sudo bluepill #{application}_#{stage} stop"
#  end
#  task :restart, :roles => :app, :except => {:no_release => true} do
#    run "sudo bluepill #{application}_#{stage} restart"
#  end
#  task :status do
#    run "sudo bluepill #{application}_#{stage} status"
#  end
#end

#namespace :rails4bp do
#  desc "update changelog file"
#  task :update_change_log do
#    %x[git log --pretty=format:"%h - %cd - %s, [%cn]" --no-merges > CHANGELOG]
#  end
#
#  desc "Send email notification"
#  task :send_notification do
#    Notifier.deploy_notification(self).deliver
#  end
#
#  desc "finalize and restart"
#  task :finalize_and_restart do
#    run "cd #{current_path} && bower install"
#  end
#end
#
##after "deploy:finalize_update", "deploy:symlink_db"
#after "deploy", "deploy:cleanup" # keep only the last 5 releases
##after "deploy:cleanup", "rails4bp:finalize_and_restart"
#
#
#set :notify_emails, ["ops@tasawr.com"]
##after :deploy, 'rails4bp:send_notification'


#executing "cd -- /u/apps/rails4bp_production/releases/20131027170610 &&
# RAILS_ENV=production RAILS_GROUPS=assets bundle exec rake assets:precompile
# bundle exec rails s -e production
# /usr/bin/env RAILS_ENV=production bundle exec unicorn /u/apps/rails4bp_production/current/config.ru -Dc /u/apps/rails4bp_production/shared/config/unicorn.rb -E production
#/u/apps/rails4bp_production/shared/bundle/ruby/2.0.0/bin/unicorn",
#"/u/apps/rails4bp_production/current/config.ru", "-Dc"
# #"/u/apps/rails4bp_production/shared/config/unicorn.rb", "-E", "production"

"""
bower install

RAILS_ENV=production RAILS_GROUPS=assets bundle exec rake assets:precompile

cp -R /u/apps/rails4bp_production/current/vendor/assets/components/backgrid /u/apps/rails4bp_production/current/public/assets/

cp -R /u/apps/rails4bp_production/current/vendor/assets/components/pace /u/apps/rails4bp_production/current/public/assets/


RAILS_ENV=production bundle exec rake sunspot:reindex

"""
