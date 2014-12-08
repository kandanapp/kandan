RSpec.describe AttachmentObserver do
  it "should create an activity on save" do

    expect_any_instance_of(Activity).to receive(:save)
    a = Attachment.new
    c = FactoryGirl.create(:channel)
    allow(a).to receive(:channel).and_return(c)
    a.save
  end
end
