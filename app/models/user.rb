require 'net/http'
require 'uri'

class User < ActiveRecord::Base
  extend Enumerize

  # Being pesimistic here and making the default waiting for approval for security reasons
  enumerize :registration_status, in: [:active, :suspended, :waiting_approval], :default => :waiting_approval

  has_many :activities
  before_save :ensure_gravatar_hash
  before_save :ensure_authentication_token

  before_create :mark_registration_status_depending_on_app_settings

  after_create :ensure_at_least_one_admin, :create_initial_channel
  after_destroy :ensure_at_least_one_admin
  
  validates :username, :presence => true, :uniqueness => true
  validate :check_external_avatar
  
  # Kandan.devise_modules is defined in config/initializers/kandan.rb
  devise devise *Kandan.devise_modules

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :locale, :gravatar_hash, :avatar_url

  def full_name
    "#{self.first_name.to_s} #{self.last_name.to_s}".titlecase
  end

  def full_name_or_username
    self.full_name.blank? ? self.username : self.full_name
  end

  # Callback to mark the user registration status depending on the settings of the app
  def mark_registration_status_depending_on_app_settings
    # If the site is public we will make the user active. Otherwise we will make the user as waiting_approval
    self.registration_status = Setting.my_settings.public_site? ? :active : :waiting_approval
  end

  def ensure_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest self.email
  end

  def ensure_authentication_token
    if self.authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  # We never want an app without an admin so let's ensure there is at least one user
  def ensure_at_least_one_admin
    if User.count == 1
      u = User.first
      u.is_admin = true
      u.save!
    end
  end
  # Creates a new channel to avoid the 'no Channel id = 1' error
  def create_initial_channel
    if User.count == 1 && Channel.count == 0
      c = Channel.create!(name: 'Example', user: User.first)
      c.save!
    end
  end


  def active_for_authentication?
    super && active?
  end

  def self.deleted_user
    dummy_user = new(:username => "Deleted User", :gravatar_hash => "", :email => "")
    dummy_user.active = false

    return dummy_user
  end

  def activate
    self.registration_status = "active"
  end

  def activate!
    self.activate && self.save!
  end

  def suspend
    self.registration_status = "suspended"
  end

  def suspend!
    self.suspend && self.save!
  end

  # Check if avatar size does not exceed setting paramater :external_avatar_max_size
  # and if image extension is allowed
  def check_external_avatar
    # avatar url is not required
    return if self.avatar_url.blank?

    uri = URI(avatar_url)

    # Check for file extension
    extension = File.extname(uri.path)
    unless Kandan::Config.options[:external_avatar_formats].include? extension.downcase
      errors.add(:avatar_url, "extension is invalid")
      return
    end

    # Check protocol
    unless ['http', 'https'].include?(uri.scheme)
      errors.add(:avatar_url, "protocol is invalid")
      return
    end

    # Check for file size
    Net::HTTP.start(uri.host, uri.port, 
                    :use_ssl => uri.scheme == 'https') do |http|
      begin
        response = http.request_head(uri.to_s)
        file_size = response['content-length']

        if file_size.nil?
          file_size = 0
        end

        size_in_bounds = Integer(file_size).between?(1, Kandan::Config.options[:external_avatar_max_size])
        unless size_in_bounds
          errors.add(:avatar_url, "image size is out of bounds (maximum %{max_size} bytes)" % {:max_size => Kandan::Config.options[:external_avatar_max_size]})
        end

      rescue
        errors.add(:avatar_url, "is invalid")
      end
    end
  end

  private
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end

end
