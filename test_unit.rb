require 'test/unit'
require File.expand_path('../test_class.rb', __FILE__)

class TestPost < Test::Unit::TestCase
  def test_add
    n = BasicNumber.new(10)
    assert_equal(10,n.add(4),'This test about add is failure!')
  end
  def test_multiply
    n = BasicNumber.new(10)
    assert_equal(40,n.multiply(4),'This test about multiply is successful.')
  end
end
