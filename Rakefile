# require File.join(File.dirname(__FILE__), 'lib', 'themes_for_rails')
require File.dirname(__FILE__) + "/lib/themes_for_rails/version.rb"

require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'

desc 'Default: run rspec for all'
task :default => :spec

desc "Run the code examples"
RSpec::Core::RakeTask.new(:spec ) do |t|
  t.pattern = "./spec/**/*_spec.rb"
end


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "themes_for_rails"
    gemspec.summary = "Themes support for rails (3)"
    gemspec.description = "It allows an application to have many different ways of rendering static assets and dynamic views."
    gemspec.email = "lucasefe@gmail.com"
    gemspec.homepage = "http://github.com/lucasefe/themes_for_rails"
    gemspec.authors = ["Lucas Florio"]
    gemspec.version = ThemesForRails::VERSION
    gemspec.add_dependency "rails", "~> 3.1.0"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
