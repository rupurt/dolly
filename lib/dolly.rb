require "dolly/version"
require "dolly/application"
require "dolly/directory"
require "dolly/database"
require "dolly/database_configuration"
require "dolly/database_tasks"
require "dolly/task"
require "dolly/railtie.rb" if defined?(Rails)

module Dolly
  def self.run(task_name=nil)
    application = Dolly::Application.new
    application.copy
    Dolly::Task.run application, task_name
  end
end
