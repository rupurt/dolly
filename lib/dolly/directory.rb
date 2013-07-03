require "rails"

module Dolly
  class Directory
    def copy
      IO.popen cmd
    end

    def copy_path
      "/tmp/#{app_dir_name}"
    end

    def app_dir_name
      Rails.root.split.last.to_s
    end

    private
    def cmd
      "rsync -a #{Rails.root} /tmp"
    end
  end
end
