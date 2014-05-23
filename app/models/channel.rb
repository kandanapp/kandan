class Channel < ActiveRecord::Base
  has_many :activities, :dependent => :destroy
  has_many :attachments, :dependent => :destroy
  belongs_to :user
  attr_accessible :name, :user

  validates :name, :presence => { :message => "Room name cannot be blank"}, :uniqueness => { :message => "Room name is already taken" }
  validates :user, :presence => { :message => "Room must belong to a user"}

  before_create :ensure_app_max_rooms

  def ensure_app_max_rooms
    valid = Setting.my_settings.max_rooms > Channel.count

    self.errors.add(:max_rooms, "This app has reached the maximum number of rooms") unless valid

    valid
  end

  class << self
    def primary
      self.find(1)
    end

    def user_connect(user)
      activity = Channel.primary.activities.new
      activity.user_id = user.id
      activity.action = "connect"
      unless Setting.my_settings.disable_conn_disconn_activity
       activity.save!
      end
    end

    def user_disconnect(user)
      activity = Channel.primary.activities.new
      activity.user_id = user.id
      activity.action = "disconnect"
      unless Setting.my_settings.disable_conn_disconn_activity
       activity.save!
      end
    end
  end
end
