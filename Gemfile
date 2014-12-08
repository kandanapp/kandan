source 'https://rubygems.org'

# Core gems
gem 'rails', '~> 3.2.21'

# Database adapters
gem 'pg'

# Uncomment next line when using MySQL database
#gem 'mysql2'

# Auth gems
gem 'devise'
gem 'cancancan', '~> 1.9'

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
gem 'arel'
gem 'tzinfo'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'bourbon'
  gem 'execjs'
  gem 'eco'
  gem 'uglifier'
  gem 'bootstrap-sass', '3.1.1.0'
  gem 'sass', '3.2.13'
  gem 'gemoji', '~> 1.5.0'
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
  if RUBY_VERSION >= '2.0.0'
    gem 'byebug'
  else
    gem 'debugger'
  end
end

group :test do
  gem 'faker'
  gem 'rspec-rails', '~> 3.1'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem 'coveralls', :require => false
  gem 'poltergeist'
  gem 'launchy'
  gem 'capybara'
end

group :development, :test do
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'database_cleaner'
  gem 'jasmine'
end
