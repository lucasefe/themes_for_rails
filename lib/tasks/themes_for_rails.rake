namespace :themes do
  desc "Creates the cached theme folder"
  task :create_cache => :environment do
    for theme in ThemesForRails.available_themes
      theme_name = File.basename(theme)
      puts "Creating #{Rails.public_path}/themes/#{theme_name}"
  
      FileUtils.mkdir_p "#{Rails.public_path}/themes/#{theme_name}"      
      FileUtils.cp_r "#{theme}/images", "#{Rails.public_path}/themes/#{theme_name}/images", :verbose => true
      FileUtils.cp_r "#{theme}/stylesheets", "#{Rails.public_path}/themes/#{theme_name}/stylesheets", :verbose => true
      FileUtils.cp_r "#{theme}/javascripts", "#{Rails.public_path}/themes/#{theme_name}/javascripts", :verbose => true
    end
  end
  desc "Removes the cached (public) theme folders"
  task :remove_cache => :environment do
    puts "Removing #{Rails.public_path}/themes"
    FileUtils.rm_r "#{Rails.public_path}/themes", :force => true
  end
  desc "Updates the cached (public) theme folders"
  task :update_cache => [:remove_cache, :create_cache]
end