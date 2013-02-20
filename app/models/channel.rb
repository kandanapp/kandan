class Channel < ActiveRecord::Base
  has_many :activities, :dependent => :destroy
  has_many :attachments, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true

  class << self
    def user_connect(user)
      Channel.all.each do |channel|
        activity = channel.activities.build(:user_id => user.id, :action => "connect")
        activity.save
      end
    end

    def user_disconnect(user)
      Channel.all.each do |channel|
        activity = channel.activities.build(:user_id => user.id, :action => "disconnect")
        activity.save
      end
    end
  end
end
