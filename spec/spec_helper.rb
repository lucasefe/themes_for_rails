ENV["RAILS_ENV"] = "test"
$:.unshift File.dirname(__FILE__)

require "dummy_app/config/environment"
require 'rspec'
require 'rspec/autorun'
require "#{File.dirname(__FILE__)}/../lib/theme_support.rb"

$:.unshift File.expand_path('../support', __FILE__)
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# require 'active_support'
# require 'active_record'
# require 'action_controller'
# require 'action_view'
# require 'rails3_plugin_toolbox'

