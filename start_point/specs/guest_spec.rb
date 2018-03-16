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
    assert_equal(30, @guest06.cash())
  end

  def test_enough_money?()
    assert_equal(true, @guest06.enough_money?(30))
  end

  def test_enough_money__returns_false()
    assert_equal(false, @guest06.enough_money?(31))
  end

  def test_pay_entry_fee()
    assert_equal(true, @guest06.pay_entry_fee(30))
  end

  def test_pay_entry_fee__returns_false()
    assert_equal(false, @guest06.pay_entry_fee(40))
  end
  
end
