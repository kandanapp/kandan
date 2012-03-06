require 'spec_helper'

describe Channel do
  describe "associations" do
    it "should have many activities" do
      should have_many(:activities)
    end
  end
end
