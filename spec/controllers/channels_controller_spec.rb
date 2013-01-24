require "spec_helper"

describe ChannelsController do
  include Devise::TestHelpers
  
  before(:all) do
    @channel = FactoryGirl.create(:channel)
    @user = FactoryGirl.create(:user)
  end

  before(:each) do
    sign_in @user
  end

  describe "GET index" do
    before do
      get :index, :format => :json
    end
    
    it "should return list of channels in JSON" do
      expect(JSON(response.body)).to be_kind_of(Array)
    end
        
    it "should have an array for activities in the JSON response" do
      expect(JSON(response.body).first["activities"]).to be_kind_of(Array)
    end
  end

  describe "GET show" do
    before do
      get :show, :id => @channel.id, :format => :json
    end
    
    it "should return the channel data in json" do
      expect(response).to be_ok
    end
  end

  describe "POST create" do   
    before do
      channel = { :name => Faker::Internet.domain_word }
      post :create, :channel => channel, :format => :json
    end
     
    it "should create a channel" do
      expect(response.status).to eq(201)
    end
  end

  describe "PUT update" do
    before do
      put :update, :id => @channel.id, :channel => {:name => "SuperTest"}, :format => :json
    end
    
    it "should update the channel" do
      expect(response.status).to eq(200)
    end
  end
  
  describe "DELETE destroy" do
    before do
      delete :destroy, :id => @channel.id, :format => :json
    end
    
    it "should destroy the channel" do
      expect(response.status).to eq(200)
    end
  end
end