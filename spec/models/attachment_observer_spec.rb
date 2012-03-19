require "spec_helper"

describe AttachmentObserver do
  it "should create an activity on save" do
    Activity.any_instance.should_receive(:save)
    Attachment.new.save
  end
end
