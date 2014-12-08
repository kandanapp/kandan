RSpec.describe Channel do
  describe "associations" do
    specify { should have_many(:activities) }
    specify { should have_many(:attachments) }
  end

  describe "user_connect" do
    it "should create an activity on every channel" do
      skip
    end
  end

  describe "user_disconnect" do
    it "should create an activity on every channel" do
      skip
    end
  end
end
