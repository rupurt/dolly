require "spec_helper"

describe Dolly::DatabaseTasks do
  describe "#create" do
    let(:db_config) { double(:db_config) }
    before do
      subject.config.stub(:to_h).and_return(db_config)
    end

    it "creates a dolly database" do
      ActiveRecord::Tasks::DatabaseTasks.should_receive(:create).with(db_config).ordered

      subject.create
    end
  end

  describe "#load_schema" do
    let(:db_config) { double(:db_config) }
    let(:file_path) { "/database/schema.rb" }
    before do
      ActiveRecord::Tasks::DatabaseTasks.stub(:db_dir).and_return("/database")
      subject.config.stub(:to_h).and_return(db_config)
    end

    context "when the schema file exists" do
      before do
        File.stub(:exists?).with(file_path).and_return(true)
      end

      it "connects to the dolly database and loads the schema file without stdout" do
        ActiveRecord::Base.should_receive(:establish_connection).with(db_config).ordered
        ActiveRecord::Schema.should_receive(:verbose=).with(false)
        subject.should_receive(:load).with(file_path).ordered

        subject.load_schema
      end
    end

    context "when the schema file doesn't exist" do
      before do
        File.stub(:exists?).with(file_path).and_return(false)
      end

      it "aborts the process" do
        subject.should_receive(:abort)

        subject.load_schema
      end
    end
  end
end
