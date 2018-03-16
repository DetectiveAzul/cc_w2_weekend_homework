require 'minitest/autorun'
require 'minitest/rg'
require_relative '../song'

class SongRoom < MiniTest::Test

  def setup()
    @song01 = Song.new("You Give Love a Bad Name")
    @song02 = Song.new("Rock You Like a Hurricane")
    @song03 = Song.new("Put a Ring on It")
    @song04 = Song.new("Bad Romance")
    @song05 = Song.new("A Whole New World")
    @song06 = Song.new("A Friend Like Me")
  end

  def test_getters()
    assert_equal("Bad Romance", @song04.title())
  end

end
