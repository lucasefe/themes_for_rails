require 'test_helper'

class ThemesForRailsTest < Test::Unit::TestCase
  
  should 'change the base directory' do
    ThemesForRails.config do |config|
      config.base_dir = 'empty_themes'
    end
    
    assert_equal [], ThemesForRails.available_theme_names
  end
  
  should 'change the directory to views' do
    ThemesForRails.config do |config|
      config.themes_dir = 'another_themes'
    end
    
    assert_equal ['another_default'], ThemesForRails.available_theme_names
  end
  
  teardown do
    ThemesForRails.config.clear
  end
  
end