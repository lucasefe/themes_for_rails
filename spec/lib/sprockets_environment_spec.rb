require 'spec_helper'
require 'themes_for_rails/sprockets_environment'

describe ThemesForRails::SprocketsEnvironment do
  it "should match the theme and the path of a given REQUEST_PATH" do
    _, theme, asset_path = *ThemesForRails::SprocketsEnvironment::THEME_REGEX_MATCHER.match("themes/pink/assets/ruby.jpg")
    theme.should == "pink"
    asset_path.should == "ruby.jpg"
  end
end
