require 'spec_helper'

describe Channel do
  describe "associations" do
    it { should have_many(:activities) }
    it { should have_many(:attachments) }
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
