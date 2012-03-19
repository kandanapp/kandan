require 'spec_helper'

describe Channel do
  describe "associations" do
    it "should have many activities" do
      should have_many(:activities)
    end

    it "should have many attachments" do
      should have_many(:attachments)
    end
  end

  describe "user_connect" do
    it "should create an activity on every channel" do
      pending
    end
  end

  describe "user_disconnect" do
    it "should create an activity on every channel" do
      pending
    end
  end
end
