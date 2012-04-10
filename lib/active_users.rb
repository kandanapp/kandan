class ActiveUsers

  # TODO has to account for users signed on from multiple devices
  # key: user_id
  # value: {:user => user_object, :client_ids: [] }
  
  @@users = {}
  
  class << self

    def add(client_id, user)
      if not find_by_user_id(user.id)
        @@users[user.id] = {:user => user, :client_ids => [client_id]}
        publish_message "connect", user
      else
        @@users[user.id][:client_ids].push client_id
      end
    end

    def remove_by_client_id(client_id)
      user_id = find_by_client_id client_id
      if user_id
        @@users[user_id][:client_ids].delete client_id
        if @@users[user_id][:client_ids].empty?
          deleted_user_info = @@users.delete user_id
          publish_message "disconnect", deleted_user_info[:user]
        end
      end
    end

    def remove_by_user_id(user_id)
      @@users.delete user_id
    end

    def find_by_client_id(client_id)
      @@users.each do |user_id, detail|
        return user_id if detail[:client_ids].include? client_id
      end
      false
    end

    def find_by_user_id(user_id)
      return @@users[user_id][:client_ids] if @@users.keys.include?(user_id)
      false
    end

    def update_user(user)
      if find_by_user_id(user.id)
        @@users[user.id][:user] = user
        publish_message "update", user
      end
    end

    def all
      users = []
      @@users.values.each do |detail|
        users.push detail[:user]
      end
      return users
    end

    def publish_message(event, user)
      Channel.send("user_#{event}", user) if not event == "update"

      FAYE_CLIENT.publish("/app/activities", {
          :event  => "user##{event}",
          :entity => user,
          :extra  => { :active_users => ActiveUsers.all }
        })
    end
  end
end
