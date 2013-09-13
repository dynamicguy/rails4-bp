# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

# for rake 0.9.0
module Rails4Bp
  class Application
    include Rake::DSL
  end
end

Rails4Bp::Application.load_tasks
