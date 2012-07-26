require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "chinese_meds"

# set :scm_command, "/opt/local/bin/git" 
# set :local_scm_command, "git" 

set :scm, :git
set :repository,  "git@github.com:alexkongg/chinese_meds.git"
set :branch, 'master'
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :deploy_to, "/home/ubuntu/www/chinese_meds"
set :user, "ubuntu"
set :use_sudo, true

server "chinese-meds.com", :web, :app, :db, :primary => true

set :rvm_ruby_string, 'ruby-1.9.3-p194@global'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
