require "spec_helper"

describe ChannelsController do
  include Devise::TestHelpers
  
  before(:all) do
    @channel = FactoryGirl.create(:channel, :id => 2)
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
  end

  shared_examples_for 'standard channel authorization' do
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
  end

  context 'an admin' do
    before(:each) do
      sign_in @admin
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
    
    it_behaves_like 'standard channel authorization'
  end

  context 'a user' do
    before(:each) do
      sign_in @user
    end
    
    describe "PUT update" do
      it "should not update the channel" do
        expect do
          put :update, :id => @channel.id, :channel => {:name => "SuperTest"}, :format => :json
        end.to raise_error(CanCan::AccessDenied)
      end
    end
    
    describe "DELETE destroy" do
      it "should not destroy the channel" do
        expect do
          delete :destroy, :id => @channel.id, :format => :json
        end.to raise_error(CanCan::AccessDenied)
      end
    end
    
    it_behaves_like 'standard channel authorization'
  end
end
