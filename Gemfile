source 'https://rubygems.org'

# Core gems
gem 'rails', '3.2.12'

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
gem 'paperclip'
gem 'remotipart'
gem 'jquery-rails'
gem 'enumerize'

# Making the world a better, more stable place
gem 'airbrake'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'bourbon', '~> 1.4.0'
  gem 'execjs'   
  gem 'eco'
  gem 'uglifier'
  gem 'bootstrap-sass', '~> 2.3.0.1'
end

group :production do
  gem 'kandan-count'
end

group :development do
  gem 'kandan-count-dev'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debugger'
end

group :test do
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
end

group :development, :test do  
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'jasmine', '~> 1.3.1'
end
