# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'faye'

# TODO move this to the lib dir
class DeviseAuth
  def incoming(message, callback)
    if message['channel'] == "/meta/subscribe"
      auth_token = message['ext']['auth_token']
      user = User.find_by_authentication_token(auth_token)
      if user
        return callback.call(message) 
      else
        message['error'] = "Invalid auth token"
      end
    end
    puts "Message: #{message.inspect}"
    callback.call(message)
  end

  #TODO disable publishing by users
end
  

faye_server = Faye::RackAdapter.new(:mount => "/faye", :timeout => 5)
faye_server.add_extension(DeviseAuth.new)

# TODO send pull request to faye to get this fixed
# by adding a rack_prefix option
# which should then make the faye server object available
# via the get_client() method on the server


FAYE_CLIENT = faye_server.get_client

faye_server.bind(:subscribe) do |client_id|
  puts "SUBSCRIBE #{client_id}"
end

faye_server.bind(:disconnect) do |client_id|
  puts "DISCONNECT #{client_id}"
  User
end

run Rack::URLMap.new({
    "/remote"  => faye_server,
    "/"      => Kandan::Application
  })

# run Kandan::Application
