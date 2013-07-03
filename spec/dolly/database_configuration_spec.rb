require "spec_helper"

describe Dolly::DatabaseConfiguration do
  describe ".database_name" do
    it "adds a _dolly suffix to the given name" do
      database_name = Dolly::DatabaseConfiguration.database_name("foo")
      expect(database_name).to eq "foo_dolly"
    end
  end

  describe "#to_h" do
    context "when the rails env is 'test'" do
      before do
        Rails.env = "test"
        test_config = {
          "foo" => "foo",
          "database" => "app_name_test"
        }
        ActiveRecord::Tasks::DatabaseTasks.stub(:current_config).with(env: "test").and_return(test_config)
      end

      it "returns the config for the rails environment with the dolly database name" do
        expect(subject.to_h["foo"]).to eq "foo"
        expect(subject.to_h["database"]).to eq "app_name_test_dolly"
      end
    end

    context "when the rails env is 'development'" do
      before do
        Rails.env = "development"
        development_config = {
          "foo" => "foo",
          "database" => "app_name_development"
        }
        ActiveRecord::Tasks::DatabaseTasks.stub(:current_config).with(env: "development").and_return(development_config)
      end

      it "returns the config for the rails environment with the dolly database name" do
        expect(subject.to_h["foo"]).to eq "foo"
        expect(subject.to_h["database"]).to eq "app_name_development_dolly"
      end
    end
  end
end
