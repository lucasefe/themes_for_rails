require "test_helper"

class ViewHelpersTest < Test::Unit::TestCase
  include ThemesForRails::ViewHelpers::InstanceMethods
  should 'provide available themes names' do
    assert_equal available_theme_names, ['Common', 'Default'] 
  end
  
end
