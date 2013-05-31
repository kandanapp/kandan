class Attachment < ActiveRecord::Base
  belongs_to :channel
  belongs_to :user
  
  if ENV['S3_BUCKET']
    has_attached_file(:file, {
      :storage         => :s3,
      :s3_credentials  => {
        :access_key_id     => ENV['S3_ACCESS_KEY_ID'],
        :secret_access_key => ENV['S3_SECRET_ACCESS_KEY'],
        :session_token     => ENV['STS_SESSION_TOKEN']
      },
      :bucket => ENV['S3_BUCKET'],
      :url    => "/:attachment/:id/:style/:basename.:extension",
      :path   => "#{ENV['S3_PREFIX']}/:attachment/:id/:style/:basename.:extension"
    })
  else
    has_attached_file :file
  end
  
  attr_accessible :file

  def url
    file.to_s
  end
end
