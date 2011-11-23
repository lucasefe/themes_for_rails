require "test_helper"

class ThemesForRailsTest < Test::Unit::TestCase
  
  should 'know the available themes' do
    assert_equal ['default'], ThemesForRails.available_theme_names
  end
  
  should 'use config for each_theme_dir' do
    ThemesForRails.config.themes_dir = 'another_themes'
    assert_equal %w(another_default), ThemesForRails.each_theme_dir.map {|theme| File.basename(theme) }
  end
  
  teardown do
    ThemesForRails.config.clear
  end
end
