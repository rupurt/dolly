require 'spec_helper'

describe Dolly do
  describe ".run" do
    it "calls copy on the Application" do
      Dolly::Application.any_instance.should_receive(:copy)

      Dolly.run
    end

    it "runs the task on the copied application" do
      application = mock(:application, copy: nil)
      Dolly::Application.stub(:new).and_return(application)
      Dolly::Task.should_receive(:run).with(application, "my_task")

      Dolly.run "my_task"
    end
  end
end
