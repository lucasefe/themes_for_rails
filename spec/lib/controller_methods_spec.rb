require "spec_helper"

describe "ActionMailerInclusion" do
  it "should include the ControllerMethods module" do
    ActionMailer::Base.included_modules.should include(ThemesForRails::ControllerMethods)
  end
end

describe "ActionControllerInclusion" do
  it "should include the ControllerMethods module" do
    ActionController::Base.included_modules.should include(ThemesForRails::ControllerMethods)
  end
end

describe "ApplicationControllerInclusion" do
  it "should include the ControllerMethods module" do
    ApplicationController.included_modules.should include(ThemesForRails::ControllerMethods)
  end
end
