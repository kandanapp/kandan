class Channel < ActiveRecord::Base
  has_many :activities

  class << self
    def user_connected(user)
      Channel.all.each do |channel|
        activity = channel.activities.build(:user_id => user.id, :action => "connect")
        activity.save
      end
    end

    def user_disconnected(user)
      Channel.all.each do |channel|
        activity = channel.activities.build(:user_id => user.id, :action => "disconnect")
        activity.save
      end
    end
  end
end
