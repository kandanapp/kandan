require "spec_helper"

describe Attachment do
  describe "associations" do
    it "should belong to channel" do
      should belong_to(:channel)
    end

    it "should belong to user" do
      should belong_to(:user)
    end
  end
end
