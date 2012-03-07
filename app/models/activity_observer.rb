class ActivityObserver < ActiveRecord::Observer

  def after_save(activity)
    Kandan::Config.broadcaster.broadcast(activity.attributes)
  end
end
