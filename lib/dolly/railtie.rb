require 'dolly'
require 'rails'

module Dolly
  class Railtie < Rails::Railtie
    initializer "active_record.initialize_database" do |app|
      # TODO: Only override connection if the task is from dolly
      # ActiveSupport.on_load(:active_record) do
        # db_config = app.config.database_configuration
        # database_name = Dolly::DatabaseConfiguration.database_name(db_config[Rails.env]["database"])
        # db_config[Rails.env]["database"] = database_name
        # self.configurations = db_config || {}
        # establish_connection
      # end
    end

    # TODO: Should be 2 rake tasks
    # 1. rake dolly:init
    #   - creates a database for each environment in the database config
    # 2. rake dolly[task_name]
    #   - copy files to /tmp
    #   - load schema for each env in database config
    #   - runs the rake task in /tmp folder against copied database
    rake_tasks do
      desc "Run rake tasks in isolation rake dolly[spec:unit]"
      task :dolly, [:task_name] => ["db:load_config"] do |t, args|
        Dolly.run args[:task_name]
      end
    end
  end
end
