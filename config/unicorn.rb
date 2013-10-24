# config/unicorn.rb

rails_env = ENV['RAILS_ENV'] || 'production'

worker_processes (rails_env == 'production' ? 6 : 3)

preload_app true

# Restart any workers that haven't responded in 30 seconds
timeout 30

working_directory '/var/www/rails4bp/current'

# Listen on a Unix data socket
pid '/var/www/rails4bp/shared/pids/unicorn.pid'
listen "/var/www/rails4bp/tmp/sockets/rails4bp.sock", :backlog => 2048

stderr_path '/var/www/rails4bp/shared/log/unicorn.log'
stdout_path '/var/www/rails4bp/shared/log/unicorn.log'

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/var/www/rails4bp/current/Gemfile"
end

before_fork do |server, worker|
  ##
  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.

  old_pid = '/var/www/rails4bp/shared/pids/unicorn.pid.oldbin'

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
