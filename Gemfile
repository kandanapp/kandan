source 'https://rubygems.org'

ruby '1.9.3'

# Core gems
gem 'rails', '3.2.12'

# Database adapters
gem 'pg'

# Auth gems
gem 'devise'

# Server/transport gems
gem 'thin'
gem 'faye'

# Helper gems
gem 'kaminari'
gem 'aws-sdk'
gem 'paperclip'
gem 'remotipart'
gem 'jquery-rails'
gem 'enumerize'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'bourbon'
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
  gem 'coveralls', :require => false
end

group :development, :test do
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'jasmine', '~> 1.3.1'
end
