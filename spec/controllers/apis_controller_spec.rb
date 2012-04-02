require "spec_helper"

describe ApisController do
  
  before :each do
    @user = Factory :user
    request.env['warden'].stub :authenticate! => @user
    controller.stub :current_user => @user
  end
  
  
  describe "active_users" do
    it "should return json" do
      get :active_users, :format => :json
      ActiveUsers.stub!(:all).and_return([])
      JSON(response.body).should be_kind_of(Array)
    end
  end
end
