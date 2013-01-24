require "spec_helper"

describe ApisController do
  describe "#active_users" do
    before do
      @user = FactoryGirl.create(:user)
    end
    context "when a user is authenticated" do
      before do
        request.env['warden'].stub :authenticate! => @user
        controller.stub :current_user => @user
        get :active_users, :format => :json
      end

      it "should return json" do
        ActiveUsers.stub!(:all).and_return([])
        JSON(response.body).should be_kind_of(Array)
      end
    end
  end
end