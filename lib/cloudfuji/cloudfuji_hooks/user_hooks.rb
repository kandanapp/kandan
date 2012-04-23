class CloudfujiUserHooks < Cloudfuji::EventObserver
  def user_added
    data = params['data']
    puts "Adding a new user with incoming data #{params.inspect}"
    puts "Devise CAS uniqueID column: #{::Devise.cas_username_column}="
    puts "Setting devise CAS uniqueID to: #{data.try(:[], 'ido_id')}"
        
    user = User.find_or_initialize_by_ido_id data['ido_id']
    user.email  = data['email']
    user.locale = data['locale']
    user.first_name = user.email.split('@').first
    user.active = true
    user.save
  end

  def user_removed
    puts "Removing user based on incoming data #{params.inspect}"
    puts "Devise CAS uniqueID column: #{::Devise.cas_username_column}="

    user = User.find_by_ido_id(params['data']['ido_id'])
    user.update_attribute(:active, false)
  end

  def user_updated
    puts "Updating user based on incoming data #{params.inspect}"
    puts "Devise CAS uniqueID column: #{::Devise.cas_username_column}="

    data = params['data']
    user = User.find_by_ido_id(data['ido_id'])

    if user
      user.cloudfuji_extra_attributes(data)
      user.save
    end
  end

end
