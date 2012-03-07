Dir["#{Rails.root}/lib/broadcasters/**/*.rb"].each do |file|
  require file
end

require "#{Rails.root}/lib/kandan_config.rb"

