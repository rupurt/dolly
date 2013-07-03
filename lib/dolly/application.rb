module Dolly
  class Application
    attr_accessor :directory, :database

    def initialize
      @directory = Dolly::Directory.new
      @database = Dolly::Database.new
    end

    def copy
      puts "Copying '#{directory.app_dir_name}' to /tmp"
      directory.copy
      database.copy
    end
  end
end
