RSpec.describe "Login" do
  before do
    @user = FactoryGirl.create(:user, :password => "mypassword")
    @channel = FactoryGirl.create(:channel, :name => "Cool")
  end

  it "shows the login form when visiting the site", js: true do
    visit root_path

    expect(page).to have_content("Sign In")
  end

  it "allows someone to log in and chat", js: true do
    visit root_path
    fill_in 'user_username', :with => @user.username
    fill_in "user_password", :with => "mypassword"

    click_button "Sign in"

    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)

    using_wait_time(10) do
      expect(page).to have_css('.chat-input')
    end

    chat_input = find(:css, ".chat-input")
    chat_input.set "Hello there"
    click_button "Post"

    within("#channel-activities-1") do
      expect(page).to have_content("Hello there")
    end

    chat_input.set "Hi again"
    click_button "Post"

    within("#channel-activities-1") do
      expect(page).to have_content("Hi again")
    end
  end
end