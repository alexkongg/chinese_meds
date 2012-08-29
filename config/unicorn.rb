# default to 1 worker, allowing override by ENV variable
worker_processes [1, ENV['UNICORN_WORKERS'].to_i].max

# This loads the application in the master process before forking
# worker processes
# Read more about it here:
# http://unicorn.bogomips.org/Unicorn/Configurator.html
preload_app true

# Restart any workers that haven't responded in 60 seconds
timeout 60

# This is where we specify the port.
# We will point the upstream Nginx module to this port later on
# The :tcp_nopush => false option allows for HTTP streaming, but we shouldn't need it
# listen '/home/ubuntu/apps/magoosh_app/current/tmp/sockets/unicorn.sock' #, :tcp_nopush => false
listen 3000 # we can't use sockets because it breaks no-downtime deploys :(

# By default, Unicorn master processes fork to the same directory that they were started in, but
# since Capistrano cleans up old releases we need to tell 
# http://unicorn.bogomips.org/Unicorn/Configurator.html#method-i-working_directory
working_directory '/u/apps/chinese_meds/current'

# Set the path of the log files
stderr_path '/u/apps/chinese_meds/shared/log/unicorn.stderr.log'
stdout_path '/u/apps/chinese_meds/shared/log/unicorn.stdout.log'

# Set the path of the PID file
pid_path = '/u/apps/chinese_meds/shared/pids/unicorn.pid'

pid pid_path 

before_exec do |server|
  ##
  # Capistrano has strange interactions with the BUNDLE_GEMFILE enivornment
  # variable, so we have to manually set it every time unicorn restarts :(
  #
  # http://unicorn.bogomips.org/Sandbox.html
  ENV["BUNDLE_GEMFILE"] = "/u/apps/chinese_meds/current/Gemfile"
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
  
  old_pid = "#{pid_path}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end


after_fork do |server, worker|
  ##
  # Unicorn master loads the app then forks off workers - because of the way
  # Unix forking works, we need to make sure we aren't using any of the parent's
  # sockets, e.g. db connection
  
  ActiveRecord::Base.establish_connection
end