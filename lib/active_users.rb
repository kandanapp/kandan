class ActiveUsers

  # TODO has to account for users signed on from multiple devices
  @@users = {}
  
  class << self

    def add(client_id, user)
      if not find_by_user_id(user.id)
        @@users[client_id] = user
        publish_message "connect", user
      end
    end

    def remove_by_client_id(client_id)
      disconnected_user = @@users.delete(client_id)
      publish_message "disconnect", disconnected_user if disconnected_user
    end

    def remove_by_user_id(user_id)
      client_id = find_by_user_id(user_id)
      if client_id
        remove_by_client_id(client_id)
        return true
      end
      false
    end

    def find_by_client_id(client_id)
      @@users[client_id]
    end

    def find_by_user_id(user_id)
      @@users.each_pair do |client_id, user|
        return client_id if user.id == user_id
      end
      false
    end

    def all
      @@users.values
    end

    def publish_message(event, user)
      # TODO this is cheating.
      # Have a common log (activities) with no channelID
      # Or find some other way
      
      Channel.send("user_#{event}", user)
      
      FAYE_CLIENT.publish("/app/activities", {
          :event => "user##{event}",
          :data  => {
            :user => user,
            :active_users => ActiveUsers.all
          }
        })
    end
  end
end
