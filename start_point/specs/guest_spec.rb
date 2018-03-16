require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest'

class TestGuest < MiniTest::Test

  def setup()
    @guest01 = Guest.new("Jaime", 30)
    @guest02 = Guest.new("Ceci", 30)
    @guest03 = Guest.new("Laia", 30)
    @guest04 = Guest.new("Rubén", 30)
    @guest05 = Guest.new("Sara", 30)
    @guest06 = Guest.new("Raquel", 30)
  end

  def test_getters()
    assert_equal("Raquel",@guest06.name())
  end

end
