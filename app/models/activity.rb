class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  attr_accessible :content, :action

  paginates_per Kandan::Config.options[:per_page]

  def user_or_deleted_user
  	self.user || User.deleted_user
  end
end
