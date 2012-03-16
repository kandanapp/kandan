class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  paginates_per Kandan::Config.options[:per_page]
end
