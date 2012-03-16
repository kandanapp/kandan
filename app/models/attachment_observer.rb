class AttachmentObserver < ActiveRecord::Observer

  def after_save(attachment)
    activity = Activity.new(
      :channel_id => attachment.channel_id,
      :user_id    => attachment.user_id,
      :action     => "upload",
      :content    => attachment.url
      )
    activity.save
  end
  
end
