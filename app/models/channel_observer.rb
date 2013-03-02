class ChannelObserver < ActiveRecord::Observer
  def after_destroy(channel)
    broadcast('delete', channel)
  end

  def after_create(channel)
    broadcast('create', channel)
  end

  private
  def broadcast(event, channel)
    data = {
      :event => "channel#" << event,
      :entity => channel.attributes,
      :extra => {}
    }
    Kandan::Config.broadcaster.broadcast("/app/activities", data)
  end
end
