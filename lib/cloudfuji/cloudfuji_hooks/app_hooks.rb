class CloudfujiAppHooks < Cloudfuji::EventObserver
  # This is here for eventual lazy-registration. Create a fake user on
  # rake cloudfuji:install, and when the app is claimed, we'll get this
  # event with the user info, so we convert the existing user and
  # update their info here.
  def app_claimed
    User.order("created_at").first.update_attributes(:email  => params['data']['email'],
                                                     :ido_id => params['data']['ido_id'])
  end
end
