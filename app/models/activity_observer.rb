class ActivityObserver < ActiveRecord::Observer

  def after_save(activity)
    faye_channel = "/channels/#{activity.channel.to_param}/messages"
    Kandan::Config.broadcaster.broadcast(faye_channel, activity.attributes)
  end
end
