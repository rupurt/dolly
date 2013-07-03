require "active_record"

module Dolly
  class DatabaseTasks
    attr_accessor :config

    def initialize
      @config = Dolly::DatabaseConfiguration.new
    end

    def create
      ActiveRecord::Tasks::DatabaseTasks.create config.to_h
    end

    def load_schema
      if File.exists?(file_path)
        ActiveRecord::Base.establish_connection config.to_h
        ActiveRecord::Schema.verbose = false
        load(file_path)
      else
        abort %{#{file_path} doesn't exist yet. Run `rake db:migrate` to create it, then try again. If you do not intend to use a database, you should instead alter #{Rails.root}/config/application.rb to limit the frameworks that will be loaded.}
      end
    end

    private
    def file_path
      File.join(ActiveRecord::Tasks::DatabaseTasks.db_dir, 'schema.rb')
    end
  end
end
