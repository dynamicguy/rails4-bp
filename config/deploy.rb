set :application, 'rails4bp_production'
set :repo_url, 'git@git.helpdocstest.com:helpiq-search/helpiq-search.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :stages, %w(staging production)
set :default_stage, 'production'

set :deploy_to, "/u/apps/#{application}"
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

set :user, "deploy"
set :use_sudo, false

namespace :deploy do

  task :start do
    on roles(:app), in: :sequence, wait: 10 do
      run "sudo bluepill load /etc/bluepill/#{application}.pill"
    end
  end

  task :stop do
    on roles(:app), in: :sequence, wait: 10 do
      run "sudo bluepill #{application} stop"
    end
  end


  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 10 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      run "sudo bluepill #{application} restart"
    end
  end

  desc "status"
  task :status do
    on roles(:app), in: :sequence, wait: 5 do
      run "sudo bluepill #{application} status"
    end
  end

  desc "schema loading"
  task :schema_load do
    on roles(:db), in: :groups, limit: 3, wait: 10 do
      #, :roles => :db, :primary => true do
      run "cd #{current_path} && rake db:schema:load RAILS_ENV=#{rails_env}"
    end
  end


  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
