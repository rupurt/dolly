require "spec_helper"

describe Dolly::Directory do
  describe "#copy" do
    it "rsync's the rails root folder to /tmp" do
      Rails.stub(:root).and_return("/mywork")
      IO.should_receive(:popen).with("rsync -a /mywork /tmp")

      subject.copy
    end
  end

  describe "#copy_path" do
    it "returns the path to the copied application" do
      pathname = Pathname.new("/mywork")
      Rails.stub(:root).and_return(pathname)

      expect(subject.copy_path).to eq "/tmp/mywork"
    end
  end

  describe "#app_dir_name" do
    it "returns the directory of the rails app" do
      pathname = Pathname.new("/myapp")
      Rails.stub(:root).and_return(pathname)

      expect(subject.app_dir_name).to eq "myapp"
    end
  end
end
