# require File.join(File.dirname(__FILE__), 'lib', 'theme_support')
require File.dirname(__FILE__) + "/lib/theme_support/version.rb"

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run tests for all ORMs.'
task :default => :test

desc 'Run unit tests.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "theme_support"
    gemspec.summary = "One line summary of your gem"
    gemspec.description = "A different and possibly longer explanation of"
    gemspec.email = "lucasefe@gmail.com"
    gemspec.homepage = "http://github.com/lucasefe/theme_support"
    gemspec.authors = ["Lucas Florio"]
    gemspec.version = ThemeSupport::VERSION
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

