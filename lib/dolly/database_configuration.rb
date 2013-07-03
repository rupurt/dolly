require "active_record"

module Dolly
  class DatabaseConfiguration
    def self.database_name(name)
      "#{name}_dolly"
    end

    def to_h
      @config ||= db_config.tap do |c|
        database_name = Dolly::DatabaseConfiguration.database_name(c["database"])
        c["database"] = database_name
      end
    end

    private
    def db_config
      ActiveRecord::Tasks::DatabaseTasks.current_config(env: Rails.env)
    end
  end
end
