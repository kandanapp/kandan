class ActivityObserver < ActiveRecord::Observer

  def after_save(activity)
    if activity.action == "message" || activity.action == "upload"
      faye_channel, broadcast_data = self.send "#{activity.action}_broadcast_data", activity
      Kandan::Config.broadcaster.broadcast(faye_channel, broadcast_data)
    end
  end

  private
  def message_broadcast_data(activity)
    faye_channel = "/channels/#{activity.channel.to_param}"
    broadcast_data = activity.attributes.merge({
        :user => activity.user.as_json(:only => [:id, :email, :first_name, :last_name, :gravatar_hash, :active, :locale, :username, :is_admin, :avatar_url]),
        :channel => activity.channel.attributes
      })
    [faye_channel, broadcast_data]
  end

  def upload_broadcast_data(activity)
    faye_channel = "/app/activities"
    broadcast_data = {
      :event  => "attachment#upload",
      :entity => activity.attributes.merge({
          :user => activity.user.as_json(:only => [:id, :email, :first_name, :last_name, :gravatar_hash, :active, :locale, :username, :is_admin, :avatar_url]),
          :channel => activity.channel.attributes
        }),
      :extra  => {
        :attachments => activity.channel.attachments.as_json(:methods => :url)
      }
    }
    [faye_channel, broadcast_data]
  end
end
