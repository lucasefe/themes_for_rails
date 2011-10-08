# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "themes_for_rails/version"

Gem::Specification.new do |s|
  s.name        = "themes_for_rails"
  s.version     = ThemesForRails::VERSION
  s.authors     = ["Lucas Florio"]
  s.email       = ["lucasefe@gmail.com"]
  s.homepage    = "https://github.com/lucasefe/themes_for_rails"
  s.description = %q{It allows an application to have many different ways of rendering static assets and dynamic views.}
  s.summary     = %q{Themes support for rails (3.1+)}
  s.rubyforge_project = "themes_for_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.extra_rdoc_files = [
    "README.textile"
  ]
  
  s.add_runtime_dependency(%q<rails>, ["~> 3.1"])
  s.add_runtime_dependency(%q<themes_for_rails>, [">= 1.0"])

  s.add_development_dependency(%q<rails>, ["~> 3.1"])
  s.add_development_dependency(%q<sqlite3>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 0"])
  s.add_development_dependency(%q<rspec-rails>, [">= 0"])
end
