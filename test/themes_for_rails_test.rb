require "test_helper"

class ThemesForRailsTest < Test::Unit::TestCase
  should 'know the available themes' do
    assert_equal ['default'], ThemesForRails.available_theme_names
  end
  
end
