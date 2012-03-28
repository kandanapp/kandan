class ChannelObserver < ActiveRecord::Observer
  def after_destroy(channel)
    broadcast_data = {
      :action => "delete",
      :channel => channel.attributes
    }
    Kandan::Config.broadcaster.broadcast("/app/channel_activities", broadcast_data)
  end
end
