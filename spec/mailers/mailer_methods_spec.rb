require "spec_helper"

THEME = 'pink'

class Notifier < ActionMailer::Base
  include ThemesForRails
  default :theme => THEME

  def welcome(user)
    mail(:theme => user.theme)
  end

  def thanks(user)
    mail
  end
end
describe "AnyMailer" do
  it "should include ThemesForRails basic functionality" do
    Notifier.included_modules.should include(ThemesForRails::ControllerMethods)
    Notifier.included_modules.should include(ThemesForRails::MailerMethods)
  end

end
describe "ThemesForRails::MailerMethods" do
  it "should set theme using mail headers" do
    Notifier.any_instance.should_receive(:set_theme).with("purple")
    user = mock("User", :theme => "purple")
    Notifier.welcome(user).deliver
  end

  it "should set theme using mail default opts" do
    Notifier.any_instance.should_receive(:set_theme).with("pink")
    user = mock("User")
    Notifier.thanks(user).deliver
  end
end



