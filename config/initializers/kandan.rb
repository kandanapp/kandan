Dir["#{Rails.root}/lib/broadcasters/**/*.rb"].each do |file|
  require file
end

module Kandan
  def self.devise_modules

    standard = [:database_authenticatable, :registerable,
                :recoverable, :rememberable, :trackable, :validatable,
                :token_authenticatable]

    cloudfuji = [:cloudfuji_authenticatable, :trackable,
                 :token_authenticatable]

    ::Cloudfuji::Platform.on_cloudfuji? ? cloudfuji : standard
  end
end
