module Broadcasters
  class Faye
    class << self
      def broadcast(channel, message)
        # NOTE FAYE_CLIENT is set in the config.ru file due to the faye bug
        puts "CHECKING TO BEGIN BROADCAST"
        if defined?(FAYE_CLIENT)
          puts "BROADCASTING... to #{channel}"
          FAYE_CLIENT.publish channel, message
        else
          puts "OOPS! FAYE_CLIENT is not defined"
        end
      end

      def assets
        ["#{ENV['KANDAN_FAYE_URL']}/remote/faye.js"]
      end
    end
  end
end
