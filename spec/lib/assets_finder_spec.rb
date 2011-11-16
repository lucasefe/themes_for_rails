require 'spec_helper'
require 'themes_for_rails/assets_finder'

describe ThemesForRails::AssetsFinder do
  it "should match the theme and the path of a given REQUEST_PATH" do
    _, theme, asset_path = *ThemesForRails::AssetsFinder::THEME_REGEX_MATCHER.match("themes/pink/assets/ruby.jpg")
    theme.should == "pink"
    asset_path.should == "ruby.jpg"
  end
end
