require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest'
require_relative '../song'

class TestGuest < MiniTest::Test

  def setup()
    song01 = Song.new("A Whole New World")
    song02 = Song.new("A Friend Like Me")
    song03 = Song.new("Everybody Was Kung-Fu Fighting")
    song04 = Song.new("Mazinger Z")

    @playlist01 = [song01, song03]
    @playlist02 = [song02, song04]

    @guest01 = Guest.new("Sara", 30, song01)
    @guest02 = Guest.new("Raquel", 30, song02)
    @guest03 = Guest.new("Poorman", 5)
  end

  def test_getters()
    assert_equal("Raquel",@guest02.name())
    assert_equal(30, @guest02.cash())
  end

  def test_enough_money?()
    assert_equal(true, @guest02.enough_money?(30))
  end

  def test_enough_money__returns_false()
    assert_equal(false, @guest02.enough_money?(31))
  end

  def test_pay_entry_fee()
    assert_equal(true, @guest02.pay_entry_fee(30))
  end

  def test_pay_entry_fee__returns_false()
    assert_equal(false, @guest02.pay_entry_fee(40))
  end

  def test_check_favourite_song_in_playlist()
    assert_equal("Wow, pal, that's my song!",
      @guest01.check_favourite_song_in_playlist(@playlist01))
  end

  def test_check_favourite_song_is_not_in_playlist()
    assert_nil(@guest02.check_favourite_song_in_playlist(@playlist01))
  end
end
