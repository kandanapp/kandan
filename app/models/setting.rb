class Setting < ActiveRecord::Base
  attr_accessible :values
  serialize :values, Hash

  before_create :set_default_values
  before_create :ensure_only_one_settings
  before_destroy :ensure_only_one_settings

  before_save :validate_max_rooms, :validate_public_site

  def max_rooms
  	self.values[:max_rooms]
  end

  def disable_conn_disconn_activity
    self.values[:disable_conn_disconn_activity]
  end

  def public_site?
  	self.values[:public_site]
  end

  alias_method :public_site, :public_site?

  def set_default_values
  	self.values.merge!(self.class.default_values)
  end

  def ensure_only_one_settings
  	return false if Setting.count >= 1
  end

  # Making sure the max_rooms is an integer and is never less than the current number of rooms
  def validate_max_rooms
  	self.values[:max_rooms].is_a?(Integer) && self.values[:max_rooms] > 0 && self.values[:max_rooms] >= Channel.count unless self.new_record?
  end

  # Making sure the public site is a boolean
  def validate_public_site
  	!!self.values[:public_site] == self.values[:public_site] unless self.new_record?
  end

  # make sure disable connect/disconnect a boolean
  def validate_conn_disconn
    !!self.values[:disable_conn_disconn_activity] == self.values[:disable_conn_disconn_activity] unless self.new_record?
  end

  def self.default_values
  	{:max_rooms => Kandan::Config.options[:max_rooms], :public_site => Kandan::Config.options[:public_site], :disable_conn_disconn_activity => Kandan::Config.options[:disable_conn_disconn_activity]}
  end

  # Helper methods to be used while we don't need to deal with multi-tenancy
  def self.my_settings
  	self.first_or_create
  end

  def self.get_value(k)
  	setting = self.my_settings
  	setting.values[k]
  end

  def self.set_values(values)
  	setting = self.my_settings

  	values.each do |k,v|
  		setting.values[k.to_sym] = v
  	end

  	setting.save!
  end

end
