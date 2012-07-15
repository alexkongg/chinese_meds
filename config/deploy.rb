
set :application, "chinese_meds"
set :repository,  "git@github.com:alexkongg/chinese_meds.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_to, "/chinese_meds"
set :user, "ubuntu"


role :web, "chinese-meds.com"                          # Your HTTP server, Apache/etc
role :app, "chinese-meds.com"                          # This may be the same as your `Web` server
role :db,  "chinese-meds.com", :primary => true # This is where Rails migrations will run


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