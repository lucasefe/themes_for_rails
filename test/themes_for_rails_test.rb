require "test_helper"

class ThemesForRailsTest < Test::Unit::TestCase
  should 'know the available themes' do
    assert_equal ['default'], ThemesForRails.available_theme_names
  end
  should 'use config for each_theme_dir' do
    ThemesForRails.config.base_dir = Rails.root + 'app'
    assert_equal ['app_theme'], ThemesForRails.each_theme_dir.map {|f| File.basename(f) }
  end
  teardown do
    ThemesForRails.config.clear
  end
end
