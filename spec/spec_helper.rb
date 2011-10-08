# encoding: utf-8
ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'
require 'rails/all'

$:.unshift File.expand_path('../../lib', __FILE__)

require 'themes_for_rails'
require "dummy_app/config/environment"

$:.unshift File.expand_path('../support', __FILE__)
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }