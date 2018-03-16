require 'minitest/autorun'
require 'minitest/rg'
require_relative '../karaokeControl'

class TestKaraokeControl < MiniTest::Test
  def setup()
    @karaoke = KaraokeControl.new
  end

  def test_create_playlist
    @karaoke.create_playlist("Disney01", "Disney02")
    assert_equal(1, @karaoke.playlists.count)
    assert_equal(2, @karaoke.playlists.first.count)
    assert_equal(Song, @karaoke.playlists[0][0].class)
  end

  def test_create_till
    @karaoke.create_till()
    assert_equal(Till, @karaoke.create_till.class)
  end

  def test_add_new_room()
    @karaoke.create_playlist("Disney01", "Disney02", "Disney03")
    @karaoke.create_playlist("Andro01", "Andro02", "Andro03")
    @karaoke.add_new_room(5, @karaoke.playlists[0], 50)

    assert_equal(Room, @karaoke.rooms.last.class)
    assert_equal(1, @karaoke.playlists.count)
    assert_equal(3, @karaoke.rooms.last.playlist.count)
    assert_equal(50, @karaoke.rooms.last.till.cash)
  end

  def test_create_customer()
    @karaoke.create_guest("Jaime", 30, "Disney02")
    assert_equal(Guest, @karaoke.guests.last.class)
    assert_equal("Jaime", @karaoke.guests.last.name)
    assert_equal(30, @karaoke.guests.last.cash)
    assert_equal("Disney02", @karaoke.guests.last.fave_song.title)
  end
  
end
