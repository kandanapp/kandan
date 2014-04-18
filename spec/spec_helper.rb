require 'simplecov'
SimpleCov.start 'rails' unless ENV['KANDAN_NO_COVERAGE']

require 'coveralls'
Coveralls.wear! 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "#{Rails.root}/lib/active_users.rb"

require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {:timeout => 60, :js_errors => false})
end

Capybara.javascript_driver = :poltergeist

require 'faye'
require ::File.expand_path("../../lib/active_users.rb",  __FILE__)
require ::File.expand_path("../../lib/faye_extensions/devise_auth.rb",  __FILE__)

faye_server = Faye::RackAdapter.new(:mount => "/remote/faye", :timeout => 30)
faye_server.add_extension(DeviseAuth.new)

FAYE_CLIENT = faye_server.get_client

faye_server.bind(:unsubscribe) do |client_id|
  ActiveUsers.remove_by_client_id(client_id)
end

Thread.new {
  EM.run
  faye_server.listen(ENV['KANDAN_FAYE_PORT'].to_i)
}

Capybara.app = Rack::URLMap.new({
  "/"        => Kandan::Application
})

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Devise::TestHelpers, :type => :controllers

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Database cleaner
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
