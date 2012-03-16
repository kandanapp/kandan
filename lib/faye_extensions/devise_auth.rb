class DeviseAuth
  def incoming(message, callback)
    if message['channel'] == "/meta/subscribe"
      auth_token = message['ext']['auth_token']
      user = User.find_by_authentication_token(auth_token)
      if user
        ActiveUsers.add(message['clientId'], user) # if not meta_channels?(message['subscription'])
        return callback.call(message) 
      else
        message['error'] = "Invalid auth token"
      end
    end
    # puts "Message: #{message.inspect}"
    callback.call(message)
  end

  # def meta_channels?(channel)
    #if ("/app/activities" =~ /\/app\/.*/ || "/app/activities" =~ /\/app\/.*/
  # end

  #TODO disable publishing by users or use only user-published msgs
end
