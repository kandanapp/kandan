class User < ActiveRecord::Base

  has_many :activities
  before_save :ensure_authentication_token
  before_save :ensure_gravatar_hash
  

  # Kandan.devise_modules is defined in config/initializers/kandan.rb
  devise devise *Kandan.devise_modules

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :locale, :gravatar_hash

  def cloudfuji_extra_attributes(extra_attributes)
    self.first_name = extra_attributes["first_name"].to_s
    self.last_name  = extra_attributes["last_name"].to_s
    self.email      = extra_attributes["email"]
    self.locale     = extra_attributes["locale"]
  end

  def ensure_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest self.email
  end

  def active_for_authentication?
    super && active?
  end

  def self.deleted_user
    dummy_user = new(:username => "Deleted User", :gravatar_hash => "", :email => "")
    dummy_user.active = false

    return dummy_user
  end

end
