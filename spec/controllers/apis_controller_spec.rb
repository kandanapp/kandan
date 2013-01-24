require "spec_helper"

describe ApisController do
  include Devise::TestHelpers
  
  describe "#active_users" do
    before do
      @user = FactoryGirl.create(:user)
    end
    
    context "when a user is authenticated" do
      before do
        sign_in @user
        get :active_users, :format => :json
      end

      it "should return json" do
        ActiveUsers.stub!(:all).and_return([])
        expect(JSON(response.body)).to be_kind_of(Array)
      end
    end
    
    context "when a user is NOT authenticated" do
      before do
        get :active_users, :format => :json
      end
      
      it "should not render any data or anything other than a 401" do
        expect(response.status).to eq(401)
      end
    end
  end
end