## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name = 'themes_for_rails'
  s.version = '0.4.3'
  s.date = '2011-11-22'
  s.rubyforge_project = 'themes_for_rails'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary = "Theme Support for Rails 3"
  s.description = "It allows an application to have many different ways of rendering static assets and dynamic views."

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors = ["Lucas Florio"]
  s.email = 'lucasefe@gmail.com'
  s.homepage = 'https://github.com/lucasefe/themes_for_rails'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## This sections is only necessary if you have C extensions.
  # s.require_paths << 'ext'
  # s.extensions = %w[ext/extconf.rb]

  ## If your gem includes any executables, list them here.
  # s.executables = ["name"]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README LICENSE]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency('rails', [">= 3.0.0"])

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  # s.add_development_dependency('rspec-rails', [">= 2.0.0"])

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    README.textile
    Rakefile
    init.rb
    lib/generators/themes_for_rails/install_generator.rb
    lib/generators/themes_for_rails/templates/README
    lib/generators/themes_for_rails/templates/theme/assets/images/.gitkeep
    lib/generators/themes_for_rails/templates/theme/assets/javascripts/.gitkeep
    lib/generators/themes_for_rails/templates/theme/assets/javascripts/application.js
    lib/generators/themes_for_rails/templates/theme/assets/stylesheets/.gitkeep
    lib/generators/themes_for_rails/templates/theme/assets/stylesheets/application.css
    lib/generators/themes_for_rails/templates/theme/views/layouts/.gitkeep
    lib/generators/themes_for_rails/theme_generator.rb
    lib/tasks/themes_for_rails.rake
    lib/themes_for_rails.rb
    lib/themes_for_rails/assets_finder.rb
    lib/themes_for_rails/common_methods.rb
    lib/themes_for_rails/config.rb
    lib/themes_for_rails/controller_methods.rb
    lib/themes_for_rails/logging.rb
    lib/themes_for_rails/mailer_methods.rb
    lib/themes_for_rails/railtie.rb
    lib/themes_for_rails/routes.rb
    lib/themes_for_rails/version.rb
    lib/themes_for_rails/view_helpers.rb
    spec/controllers/my_controller_spec.rb
    spec/dummy/.gitignore
    spec/dummy/Gemfile
    spec/dummy/Gemfile.lock
    spec/dummy/README
    spec/dummy/Rakefile
    spec/dummy/app/assets/images/rails.png
    spec/dummy/app/assets/javascripts/application.js
    spec/dummy/app/assets/stylesheets/application.css
    spec/dummy/app/controllers/application_controller.rb
    spec/dummy/app/helpers/application_helper.rb
    spec/dummy/app/mailers/.gitkeep
    spec/dummy/app/models/.gitkeep
    spec/dummy/app/themes/default/assets/images/rails.png
    spec/dummy/app/themes/default/assets/javascripts/application.js
    spec/dummy/app/themes/default/assets/stylesheets/application.css
    spec/dummy/app/themes/default/views/layouts/application.html.erb
    spec/dummy/app/views/layouts/application.html.erb
    spec/dummy/config.ru
    spec/dummy/config/application.rb
    spec/dummy/config/boot.rb
    spec/dummy/config/database.yml
    spec/dummy/config/environment.rb
    spec/dummy/config/environments/development.rb
    spec/dummy/config/environments/production.rb
    spec/dummy/config/environments/test.rb
    spec/dummy/config/initializers/backtrace_silencers.rb
    spec/dummy/config/initializers/inflections.rb
    spec/dummy/config/initializers/mime_types.rb
    spec/dummy/config/initializers/secret_token.rb
    spec/dummy/config/initializers/session_store.rb
    spec/dummy/config/initializers/wrap_parameters.rb
    spec/dummy/config/locales/en.yml
    spec/dummy/config/routes.rb
    spec/dummy/db/seeds.rb
    spec/dummy/doc/README_FOR_APP
    spec/dummy/lib/assets/.gitkeep
    spec/dummy/lib/tasks/.gitkeep
    spec/dummy/log/.gitkeep
    spec/dummy/public/404.html
    spec/dummy/public/422.html
    spec/dummy/public/500.html
    spec/dummy/public/favicon.ico
    spec/dummy/public/index.html
    spec/dummy/public/robots.txt
    spec/dummy/script/rails
    spec/dummy/test/fixtures/.gitkeep
    spec/dummy/test/functional/.gitkeep
    spec/dummy/test/integration/.gitkeep
    spec/dummy/test/performance/browsing_test.rb
    spec/dummy/test/test_helper.rb
    spec/dummy/test/unit/.gitkeep
    spec/dummy/vendor/assets/stylesheets/.gitkeep
    spec/dummy/vendor/plugins/.gitkeep
    spec/lib/assets_finder_spec.rb
    spec/lib/common_methods_spec.rb
    spec/lib/config_spec.rb
    spec/lib/controller_methods_spec.rb
    spec/lib/view_helpers_spec.rb
    spec/mailers/mailer_methods_spec.rb
    spec/spec_helper.rb
    test/dummy_app/Gemfile.lock
    test/dummy_app/log/development.log
    test/dummy_app/log/test.log
    themes_for_rails.gemspec
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  # s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end

