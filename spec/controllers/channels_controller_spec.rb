require "spec_helper"

describe ChannelsController do
  describe "GET index" do
    it "should return list of channels in JSON" do
      get :index
    end
  end
end
