class BushidoUserHooks < Bushido::EventObserver
  def user_added
    puts "Adding a new user with incoming data #{params.inspect}"
    puts "Devise username column: #{::Devise.cas_username_column}="
    puts "Setting username to: #{params['data'].try(:[], 'ido_id')}"

    user = User.new(:email => params['data'].try(:[], 'email'))
    user.first_name = user.email.split('@').first
    user.send("#{::Devise.cas_username_column}=".to_sym, params['data'].try(:[], 'ido_id'))
    user.save
  end

  def user_removed
    puts "Removing user based on incoming data #{params.inspect}"
    puts "Devise username column: #{::Devise.cas_username_column}="

    user = User.find_by_ido_id(params['data']['ido_id'])

    # TODO: Disable the user instead of destroying them (to prevent data loss)
    user.update_attribute(:active, false)
  end

  def user_updated
    puts "Updating user based on incoming data #{params.inspect}"
    puts "Devise username column: #{::Devise.cas_username_column}="

    data = params['data']
    user = User.find_by_ido_id(data['ido_id'])

    if user
      # Re-use the CAS login method to set all the extra attributes we
      # care about (first_name, last_name, email, local, timezone,
      # etc.)
      user.bushido_extra_attributes(data)
      user.save
    end
  end
end
