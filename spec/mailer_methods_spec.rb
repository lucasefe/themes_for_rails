require "spec_helper"

THEME = 'pink'

class Notifier < ActionMailer::Base
  default :theme => THEME

  def welcome(user)
    mail(:theme => user.theme)
  end

  def thanks(user)
    mail
  end
end

describe "ThemesForRails::MailerMethods" do
  it "should set theme using mail headers" do
    #Notifier.stub(:new).should_receive(:theme).with("purple")

    #user = mock("User", :theme => "purple")
    #Notifier.welcome(user)
    pending "just do it"
  end

  it "should set theme using mail default opts" do
    #Notifier.stub(:new).should_receive(:theme).with("pink")

    #user = mock("User")
    #Notifier.thanks(user)
    pending "just do it"
  end
end