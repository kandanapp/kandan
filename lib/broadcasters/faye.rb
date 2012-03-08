module Broadcasters
  class Faye
    class << self
      def broadcast(channel, message)
        # NOTE FAYE_CLIENT is set in the config.ru file due to the faye bug
        if defined?(FAYE_CLIENT) && (not FAYE_CLIENT.nil?)
          FAYE_CLIENT.publish channel, message
        else
          puts "OOPS! FAYE_CLIENT is not defined"
        end
      end

      def assets
        ["/remote/faye.js"]
      end
    end
  end
end
