require "test_helper"

class ThemesForRailsTest < Test::Unit::TestCase
  should 'know the available themes' do
    assert_equal ThemesForRails.available_theme_names, ['default']
  end
end
