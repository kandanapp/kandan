require 'spec_helper'

describe User do
  describe "associations" do
    it "should have many activities" do
      should have_many(:activities)
    end
  end

  it "should have authentication token on creation" do
    @user = Factory :user
    @user.authentication_token.should_not be_nil
  end

  it "should have gravatar hash on creation" do
    @user = Factory :user
    @user.gravatar_hash.should_not be_nil
  end
end
