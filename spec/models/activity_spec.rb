require 'spec_helper'

describe Activity do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:channel) }
  end
end
