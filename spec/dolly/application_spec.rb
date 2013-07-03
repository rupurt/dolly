require "spec_helper"

describe Dolly::Application do
  before do
    STDOUT.stub(:puts)
  end

  describe "#copy" do
    before do
      subject.directory.stub(:app_dir_name)
    end

    it "copies the directory and database" do
      subject.directory.should_receive(:copy).ordered
      subject.database.should_receive(:copy).ordered

      subject.copy
    end
  end
end
