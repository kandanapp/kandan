require "spec_helper"

describe AttachmentObserver do
  it "should create an activity on save" do

    Activity.any_instance.should_receive(:save)
    a = Attachment.new
    c = FactoryGirl.create(:channel)
    a.stub(:channel).and_return(c)
    a.save
  end
end
