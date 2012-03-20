class ActivityObserver < ActiveRecord::Observer

  def after_save(activity)
    if activity.action == "message" || activity.action == "upload"
      faye_channel = "/channels/#{activity.channel.to_param}"
      broadcast_data = activity.attributes.merge({
          :user => activity.user.attributes,
          :channel => activity.channel.attributes
        })
      Kandan::Config.broadcaster.broadcast(faye_channel, broadcast_data)
    end
  end
end
