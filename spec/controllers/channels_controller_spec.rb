require "spec_helper"

describe ChannelsController do

  before :all do
    @channel = Factory :channel
    # @sample_activity = @channel.activities.build :action => "message"
  end

  before :each do
    @user = Factory :user
    request.env['warden'].stub :authenticate! => @user
    controller.stub :current_user => @user
  end
  
  describe "GET index" do
    it "should return list of channels in JSON" do
      get :index, :format => :json
      JSON(response.body).should be_kind_of(Array)
      JSON(response.body).first.should have_key("activities")
    end
  end

  describe "GET show" do
    it "should return the channel data in json" do
      get :show, :id => @channel.id, :format => :json
      response.should be_ok
    end
  end

  describe "POST create" do
    it "should create a channel" do
      channel_attributes = Factory.build :channel
      Channel.any_instance.should_receive(:save)
      post :create, :format => :json
    end
  end

  describe "PUT update" do
    it "should update the channel" do
      # Channel.any_instance.should_receive(:update_attributes)
      put :update, :id => @channel.id, :channel => {:name => "SuperTest"}, :format => :json
      response.should be_ok
    end
  end
  
  describe "DELETE destroy" do
    it "should destroy the channel" do
      # Channel.any_instance.should_receive(:destroy)
      delete :destroy, :id => @channel.id, :format => :json
      response.should be_ok
    end
  end

end
