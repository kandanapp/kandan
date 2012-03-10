class ActivityObserver < ActiveRecord::Observer

  def after_save(activity)
    faye_channel = "/channels/#{activity.channel.to_param}"
    # TODO move this to a rabl template
    broadcast_data = activity.attributes.merge({:user => activity.user.attributes})
    Kandan::Config.broadcaster.broadcast(faye_channel, broadcast_data)
  end
end
