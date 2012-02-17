# encoding: utf-8
require File.expand_path("test/test_helper.rb")

class ThemesForRailsIntegrationTest < ::ActionController::IntegrationTest

  should "work with Rails 3.0 default configuration" do
    asset_path = "/themes/default/stylesheets/style.css"
    get asset_path
    assert_equal 200, status
    assert_equal asset_path, path
  end
end