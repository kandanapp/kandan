class User < ActiveRecord::Base

  has_many :activities
  before_save :ensure_authentication_token
  before_save :ensure_gravatar_hash
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :bushido_authenticatable, :token_authenticatable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation, :remember_me, :ido_id, :first_name, :last_name, :locale, :gravatar_hash

  def bushido_extra_attributes(extra_attributes)
    self.first_name = extra_attributes["first_name"].to_s
    self.last_name  = extra_attributes["last_name"].to_s
    self.email      = extra_attributes["email"]
  end

  def ensure_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest self.email
  end

end
