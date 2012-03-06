# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'faye'

faye_server = Faye::RackAdapter.new(:mount => "/faye", :timeout => 5)

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
end

run Rack::URLMap.new({
    "/remote"  => faye_server,
    "/"      => Kandan::Application
  })

# run Kandan::Application
