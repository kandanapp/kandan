require 'spec_helper'

describe Activity do
  describe "associations" do
    it "should belong to user" do
      should belong_to(:user)
    end

    it "should belong to channel" do
      should belong_to(:channel)
    end
  end
end
