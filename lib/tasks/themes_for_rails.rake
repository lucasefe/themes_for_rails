namespace :themes do
  desc "Creates the cached theme folder"
  task :create_cache => :environment do
    for theme in ThemesForRails.available_themes
      theme_name = File.basename(theme)
      theme_dir = ThemesForRails.config.themes_dir
      theme_base = "#{Rails.public_path}/#{theme_dir}/#{theme_name}"
      puts "Creating #{theme_base}"

      FileUtils.mkdir_p "#{theme_base}"
      FileUtils.cp_r Dir["#{theme}/{images,stylesheets,javascripts}"], theme_base, :verbose => true
    end
  end
  desc "Removes the cached (public) theme folders"
  task :remove_cache => :environment do
    theme_dir = ThemesForRails.config.themes_dir
    puts "Removing #{Rails.public_path}/#{theme_dir}"
    FileUtils.rm_r "#{Rails.public_path}/#{theme_dir}", :force => true
  end
  desc "Updates the cached (public) theme folders"
  task :update_cache => [:remove_cache, :create_cache]

  desc "Add theme view paths to ActionView PathSet"
  task :add_theme_to_view_paths => :environment do
    raise 'you must provide THEME for theme support to work' unless theme = ENV['THEME']
    puts "adding theme [#{theme}] to view path"
    require 'themes_for_rails/common_methods'
    include ThemesForRails::CommonMethods

    theme_view_path=theme_view_path_for(theme)
    ActionController::Base.view_paths.paths.prepend(theme_view_path) if theme
  end
end

namespace :cache_digests do
  puts "patching cache_digests with themes_for_rails support"
  # Add themes support to cache_digest gem rake tasks
  task :nested_dependencies => ['themes:add_theme_to_view_paths']
  task :dependencies => ['themes:add_theme_to_view_paths']
end
