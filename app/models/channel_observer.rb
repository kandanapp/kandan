class ChannelObserver < ActiveRecord::Observer
  def after_destroy(channel)
    broadcast_data = {
      :event  => "channel#delete",
      :entity => channel.attributes,
      :extra  => {}
    }

    Kandan::Config.broadcaster.broadcast("/app/activities", broadcast_data)
  end
end
