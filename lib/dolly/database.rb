module Dolly
  class Database
    attr_accessor :tasks

    def initialize
      @tasks = Dolly::DatabaseTasks.new
    end

    def copy
      puts "Copying database"
      tasks.create
      tasks.load_schema
    end
  end
end
