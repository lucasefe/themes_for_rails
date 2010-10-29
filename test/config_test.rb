require 'test_helper'

class ThemesForRailsTest < Test::Unit::TestCase
  should 'change the path to views' do
    ThemesForRails::Config.new do |config|
      config.theme_path 'another_themes'
    end
    
    assert_equal ['default'], ThemesForRails.available_theme_names
  end
end