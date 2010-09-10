require 'active_support/test_case'

class ActiveSupport::TestCase
  def assert_named_route(result, name)
    assert_equal result, @routes.url_helpers.send(name)
  end
end