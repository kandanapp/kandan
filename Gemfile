source 'https://rubygems.org'

# Core gems
gem 'rails', '3.2.11'

# Database adapters
gem 'pg'

# Auth/Cloudfuji gems
gem 'devise'
gem 'devise_cloudfuji_authenticatable'
gem 'cloudfuji'

# Server/transport gems
gem 'thin'
gem '_bushido-faye', '0.8.2'

# Helper gems
gem 'kaminari'
gem 'aws-sdk'
gem 'cloudfuji_paperclip'
gem 'remotipart'
gem 'jquery-rails'

# Making the world a better, more stable place
gem 'airbrake'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'bourbon'
  gem 'execjs'   
  gem 'eco'
  gem 'uglifier'
end

group :development do
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end

group :development, :test do  
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'jasmine', :git => 'https://github.com/pivotal/jasmine-gem.git', :branch => '1.2.rc1'
end