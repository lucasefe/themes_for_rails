require 'active_support/test_case'

class ActiveSupport::TestCase
  def assert_named_route(result, name)
    assert_equal result, @routes.url_helpers.send(name)
  end
  def assert_send_file(result)
    assert(@response.body.is_a? Proc)
    require 'stringio'
    output = StringIO.new
    output.binmode
    assert_nothing_raised { @response.body.call(@response, output) }
    puts "OUT: #{output.output}"
    assert_equal(result, output.string)
  end
end