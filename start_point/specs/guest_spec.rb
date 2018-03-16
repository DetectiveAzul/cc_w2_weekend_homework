require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest'

class TestGuest < MiniTest::Test

  def setup()
    @guest01 = Guest.new("Jaime")
    @guest02 = Guest.new("Ceci")
    @guest03 = Guest.new("Laia")
    @guest04 = Guest.new("Rubén")
    @guest05 = Guest.new("Sara")
    @guest06 = Guest.new("Raquel")
  end

  def test_getters()
    assert_equal("Raquel",@guest06.name())
  end

end
