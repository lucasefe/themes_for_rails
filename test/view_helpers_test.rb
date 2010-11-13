require "test_helper"

class ViewHelpersTest < Test::Unit::TestCase
  include ThemesForRails::ViewHelpers::InstanceMethods
  should 'provide available themes names' do
    assert_equal available_theme_names, ['Common', 'Default'] 
  end
  
  should 'provide thumbs of themes' do
    theme = 'common'
    assert_equal thumb_url(theme), Dir[File.join(ThemesForRails.config.base_dir, ThemesForRails.config.themes_dir, theme, 'images', 'thumbs.{jpg,gif}').to_s].first
  end
  
end
