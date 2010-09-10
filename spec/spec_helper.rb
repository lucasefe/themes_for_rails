ENV["RAILS_ENV"] = "test"
require "dummy_app/config/environment"
require 'rails/all'
$:.unshift File.expand_path('../support', __FILE__)
require "#{File.dirname(__FILE__)}/../lib/theme_support.rb"

require 'action_dispatch/testing/assertions/routing'
require 'action_dispatch/testing/integration'
require 'action_dispatch/routing'
require 'active_support'
require 'active_record'
require 'action_controller'
require 'action_view'

require 'rspec/rails'
require 'rspec/rails/adapters'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include ActionDispatch::Assertions::RoutingAssertions
  config.include RSpec::Rails::Matchers::RoutingMatchers
  
end

