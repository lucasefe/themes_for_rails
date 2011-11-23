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
  s.extra_rdoc_files = %w[README.textile LICENSE]

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
    LICENSE
    README.textile
    REVIEW_NOTES
    RMU_REVIEW
    Rakefile
    TODO.textile
    init.rb
    lib/generators/themes_for_rails/install_generator.rb
    lib/generators/themes_for_rails/templates/theme/images/.gitkeep
    lib/generators/themes_for_rails/templates/theme/javascripts/.gitkeep
    lib/generators/themes_for_rails/templates/theme/stylesheets/.gitkeep
    lib/generators/themes_for_rails/templates/theme/views/layouts/.gitkeep
    lib/generators/themes_for_rails/theme_generator.rb
    lib/tasks/themes_for_rails.rake
    lib/themes_for_rails.rb
    lib/themes_for_rails/assets_controller.rb
    lib/themes_for_rails/common_methods.rb
    lib/themes_for_rails/config.rb
    lib/themes_for_rails/controller_methods.rb
    lib/themes_for_rails/mailer_methods.rb
    lib/themes_for_rails/railtie.rb
    lib/themes_for_rails/routes.rb
    lib/themes_for_rails/url_helpers.rb
    lib/themes_for_rails/view_helpers.rb
    test/assets_controller_test.rb
    test/common_methods_test.rb
    test/config_test.rb
    test/controller_methods_test.rb
    test/dummy_app/.gitignore
    test/dummy_app/Gemfile
    test/dummy_app/Rakefile
    test/dummy_app/another_themes/another_default/images/logo.png
    test/dummy_app/another_themes/another_default/images/nested/logo.png
    test/dummy_app/another_themes/another_default/javascripts/app.js
    test/dummy_app/another_themes/another_default/stylesheets/style.css
    test/dummy_app/another_themes/another_default/stylesheets/style2.css
    test/dummy_app/another_themes/another_default/views/layouts/default.html.erb
    test/dummy_app/another_themes/another_default/views/products/index.html.erb
    test/dummy_app/app/controllers/application_controller.rb
    test/dummy_app/app/helpers/application_helper.rb
    test/dummy_app/app/views/layouts/application.html.erb
    test/dummy_app/config.ru
    test/dummy_app/config/application.rb
    test/dummy_app/config/boot.rb
    test/dummy_app/config/database.yml
    test/dummy_app/config/environment.rb
    test/dummy_app/config/environments/development.rb
    test/dummy_app/config/environments/production.rb
    test/dummy_app/config/environments/test.rb
    test/dummy_app/config/initializers/backtrace_silencers.rb
    test/dummy_app/config/initializers/inflections.rb
    test/dummy_app/config/initializers/mime_types.rb
    test/dummy_app/config/initializers/secret_token.rb
    test/dummy_app/config/initializers/session_store.rb
    test/dummy_app/config/locales/en.yml
    test/dummy_app/config/routes.rb
    test/dummy_app/db/seeds.rb
    test/dummy_app/empty_themes/.gitkeep
    test/dummy_app/lib/tasks/.gitkeep
    test/dummy_app/log/test.log
    test/dummy_app/public/404.html
    test/dummy_app/public/422.html
    test/dummy_app/public/500.html
    test/dummy_app/public/favicon.ico
    test/dummy_app/public/images/rails.png
    test/dummy_app/public/index.html
    test/dummy_app/public/javascripts/application.js
    test/dummy_app/public/javascripts/controls.js
    test/dummy_app/public/javascripts/dragdrop.js
    test/dummy_app/public/javascripts/effects.js
    test/dummy_app/public/javascripts/prototype.js
    test/dummy_app/public/javascripts/rails.js
    test/dummy_app/public/robots.txt
    test/dummy_app/public/stylesheets/.gitkeep
    test/dummy_app/script/rails
    test/dummy_app/themes/default/images/logo.png
    test/dummy_app/themes/default/images/nested/logo.png
    test/dummy_app/themes/default/javascripts/app.js
    test/dummy_app/themes/default/stylesheets/images/logo.png
    test/dummy_app/themes/default/stylesheets/style.css
    test/dummy_app/themes/default/stylesheets/style2.css
    test/dummy_app/themes/default/views/layouts/default.html.erb
    test/dummy_app/themes/default/views/products/index.html.erb
    test/mailer_methods_test.rb
    test/routes_test.rb
    test/support/extensions.rb
    test/test_helper.rb
    test/themes_for_rails_test.rb
    test/view_helpers_test.rb
    themes_for_rails.gemspec
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/.*_test\.rb/ }
end

