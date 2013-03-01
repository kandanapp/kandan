class Channel < ActiveRecord::Base
  has_many :activities, :dependent => :destroy
  has_many :attachments, :dependent => :destroy

  validates :name, :presence => { :message => "Room name cannot be blank"}, :uniqueness => { :message => "Room name is already taken" }

  before_create :ensure_app_max_rooms

  def ensure_app_max_rooms
    valid = Setting.my_settings.max_rooms > Channel.count

    self.errors.add(:max_rooms, "This app has reached the maximum number of rooms") unless valid

    valid
  end

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
