require "spec_helper"

describe "ThemesForRails::CommonMethods" do
  before :all do
    @common = Object.new
    @common.extend ThemesForRails::CommonMethods
    @common.theme_name = "awesome"
    ThemesForRails.config.clear
  end
end