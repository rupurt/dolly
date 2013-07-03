require "spec_helper"

describe Dolly::Database do
  describe "#copy" do
    before do
      STDOUT.stub(:puts)
    end

    it "creates a dolly database and loads the schema" do
      subject.tasks.should_receive(:create).ordered
      subject.tasks.should_receive(:load_schema).ordered

      subject.copy
    end
  end
end
