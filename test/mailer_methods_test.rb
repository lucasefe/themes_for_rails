require File.expand_path("test/test_helper.rb")

class Notifier < ActionMailer::Base

  def welcome(user)
    mail(:theme => user.theme)
  end
end

module ThemesForRails
  class MailerMethodsTest < ActionController::TestCase

    should "set theme using mail headers" do
      Notifier.any_instance.expects(:theme).with("purple")

      user = mock("User", :theme => "purple")
      Notifier.welcome(user)
    end
  end
end
