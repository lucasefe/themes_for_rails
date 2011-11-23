require File.expand_path("test/test_helper.rb")

class ThemesForRailsTest < Test::Unit::TestCase
  setup do
    @common = Object.new
    @common.extend ThemesForRails::CommonMethods
    @common.theme_name = "awesome"
    ThemesForRails.config.clear
  end
  should 'use config base_dir to build theme path' do
    ThemesForRails.config.base_dir ='some_path'
    assert_match /some_path/, @common.theme_path
  end
  should 'use config themes_dir to build theme path' do
    ThemesForRails.config.themes_dir ='skinner'
    assert_match /skinner/, @common.theme_path
  end
  should 'use config base_dir to build theme path for theme' do
    ThemesForRails.config.base_dir ='some_path'
    assert_match /some_path/, @common.theme_path_for('doodley')
  end
end