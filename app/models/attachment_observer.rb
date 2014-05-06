class AttachmentObserver < ActiveRecord::Observer

  def after_save(attachment)
    activity = Activity.new(
      :action     => "upload",
      :content    => attachment.url
      )
    activity.channel_id = attachment.channel_id
    activity.user_id    = attachment.user_id
    activity.save
  end
  
end
