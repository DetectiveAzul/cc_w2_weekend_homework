require 'minitest/autorun'
require 'minitest/rg'
require_relative '../room'
require_relative '../song'
require_relative '../guest'

class TestRoom < MiniTest::Test

  def setup()
    song01 = Song.new("You Give Love a Bad Name")
    song02 = Song.new("Rock You Like a Hurricane")
    song03 = Song.new("Put a Ring on It")
    song04 = Song.new("Bad Romance")
    song05 = Song.new("A Whole New World")
    song06 = Song.new("A Friend Like Me")

    rock_playlist = [song01, song02]
    lady_gaga_playlist = [song03, song04]
    disney_playlist = [song05, song06]

    @disney_room = Room.new(1, disney_playlist)
    @rock_room = Room.new(2, rock_playlist)
    @lady_gaga = Room.new(3, lady_gaga_playlist)
  end

  def test_get_room_name()
    assert_equal(2, @rock_room.number())
  end

  def test_get_room_occupant_count()
    assert_equal(0, @lady_gaga.occupants.count())
  end

  def test_get_room_play_list()
    assert_equal("A Friend Like Me", @disney_room.playlist.last.title())
  end

end
