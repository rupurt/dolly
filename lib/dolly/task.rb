module Dolly
  class Task
    def self.run(application, task_name=nil)
      # IO.popen "cd #{application.directory.copy_path}"
      # IO.popen "rake spec" do |fd|
        # until fd.eof?
          # puts fd.gets
        # end
      # end
    end
  end
end
