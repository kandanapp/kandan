require 'spec_helper'

describe "Login" do
  before do
    @user = FactoryGirl.create(:user, :password => "mypassword")
    @channel = FactoryGirl.create(:channel, :name => "Cool")
  end

  it "shows the login form when visiting the site", js: true do
    visit root_path

    page.should have_content("Sign In")

  end

  it "allows someone to log in and chat", js: true do
    visit root_path
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => "mypassword"

    click_button "Sign in"

    page.should have_content(@user.first_name)
    page.should have_content(@user.last_name)

    fill_in "chat-input", :with => "Hello there"
    click_button "Post"

    within("#channel-activities-1") do
      page.should have_content("Hello there")
    end

    fill_in "chat-input", :with => "Hi again"
    click_button "Post"

    within("#channel-activities-1") do
      page.should have_content("Hi again")
    end

  end
end