# encoding: utf-8
require File.expand_path("test/test_helper.rb")

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

module ThemesForRails
  class ActionMailerTest < ::ActionController::TestCase

    should "set theme using mail headers" do
      Notifier.any_instance.expects(:theme).with("purple")

      user = mock("User", :theme => "purple")
      Notifier.welcome(user)
    end

    should "set theme using mail default opts" do
      Notifier.any_instance.expects(:theme).with("pink")

      user = mock("User")
      Notifier.thanks(user)
    end
  end
end
