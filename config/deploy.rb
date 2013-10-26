require "bundler/capistrano"
require 'capistrano/ext/multistage'
require './config/deploy/cap_notify.rb'
#require 'puma/capistrano'

set :stages, [:staging, :production, :cars, :electronics, :properties]
set :default_stage, :production

set :app_name, 'rails4bp'
set :application, 'rails4bp'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :repository, "git@git.helpdocstest.com:helpiq-search/helpiq-search.git"
set :scm, :git


set :user, "deploy"
set :use_sudo, false

set :deploy_to, defer { "/u/apps/#{app_name}_#{stage}" }

before "deploy:assets:precompile" do
  run "cd #{release_path}"
  run "/usr/local/node/bin/bower install"
end

before "deploy:finalize_update" do
  run "rm -f #{release_path}/config/database.yml; ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "mkdir -p #{release_path}/tmp"
  run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
end

namespace :deploy do
  task :start do
    run "sudo bluepill load /etc/bluepill/#{app_name}_#{stage}.pill"
  end
  task :stop do
    run "sudo bluepill #{app_name}_#{stage} stop"
  end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "sudo bluepill #{app_name}_#{stage} restart"
  end
  task :status do
    run "sudo bluepill #{app_name}_#{stage} status"
  end
end

namespace :rails4bp do
  desc "update changelog file"
  task :update_change_log do
    %x[git log --pretty=format:"%h - %cd - %s, [%cn]" --no-merges > CHANGELOG]
  end

  desc "Send email notification"
  task :send_notification do
    Notifier.deploy_notification(self).deliver
  end
end

#after "deploy:finalize_update", "deploy:symlink_db"
after "deploy", "deploy:cleanup" # keep only the last 5 releases


set :notify_emails, ["ops@tasawr.com"]
#after :deploy, 'rails4bp:send_notification'
