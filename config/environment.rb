# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ChineseMeds::Application.initialize!


namespace :gems do
  task :install do
    run "cd #{deploy_to}/current && RAILS_ENV=production rake gems:install"
  end
end
after :deploy, "gems:install"