require 'minitest/autorun'
require 'minitest/rg'
require_relative '../till'

class TestTill < MiniTest::Test

  def setup()
    @till = Till.new()
  end

  def test_setters()
    @till.cash += 100
    assert_equal(100, @till.cash)
  end
end
