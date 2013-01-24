require 'spec_helper'

describe User do
  describe "associations" do
    it { should have_many(:activities) }
  end

  it "should have authentication token on creation" do
    subject { @user.authentication_token }
    expect(subject).to_not eq(nil)
  end

  it "should have gravatar hash on creation" do
    subject { @user.gravatar_hash }
    expect(subject).to_not eq(nil)
  end
end