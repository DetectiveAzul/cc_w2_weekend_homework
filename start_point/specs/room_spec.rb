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

    @song07 = Song.new("Mazinger Z")

    rock_playlist = [song01, song02]
    lady_gaga_playlist = [song03, song04]
    disney_playlist = [song05, song06]

    @guest01 = Guest.new("Jaime", 30)
    @guest02 = Guest.new("Ceci", 30)
    @guest03 = Guest.new("Laia", 30)
    @guest04 = Guest.new("Rubén", 30)
    @guest05 = Guest.new("Pedro", 30)
    @guest06 = Guest.new("Poor-man Mcboatface", 5)

    @disney_room = Room.new(1, 4, disney_playlist)
    @rock_room = Room.new(2, 4, rock_playlist)
    @lady_gaga = Room.new(3, 4, lady_gaga_playlist)
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

  def test_get_room_size()
    assert_equal(4, @disney_room.size())
  end

  def test_get_room_fee()
    assert_equal(15, @disney_room.entry_fee())
  end

  def test_add_guest_to_occupants()
    @disney_room.add_guest_to_occupants(@guest01)
    @disney_room.add_guest_to_occupants(@guest02)
    assert_equal(2, @disney_room.occupants.count())
  end

  def test_add_money_to_till()
    result = @disney_room.add_money_to_till(100)
    assert_equal(100, @disney_room.till)
  end

  def test_add_guest_to_occupants__not_enough_money()
    @disney_room.add_guest_to_occupants(@guest06)
    assert_equal(0, @disney_room.till)
    assert_equal(0, @disney_room.occupants.count)
    assert_equal(5, @guest06.cash)
    assert_equal(false, @disney_room.add_guest_to_occupants(@guest06))
  end

  def test_add_guest_to_occupants__not_enough_size()
    @disney_room.add_guest_to_occupants(@guest01)
    @disney_room.add_guest_to_occupants(@guest02)
    @disney_room.add_guest_to_occupants(@guest03)
    @disney_room.add_guest_to_occupants(@guest04)
    result = @disney_room.add_guest_to_occupants(@guest05)

    assert_equal(false, result)
    assert_equal(60, @disney_room.till)
    assert_equal(4, @disney_room.occupants.count)
    assert_equal(30, @guest05.cash)
  end

  def test_remove_guest_from_occupants()
    @disney_room.add_guest_to_occupants(@guest01)
    @disney_room.add_guest_to_occupants(@guest02)
    @disney_room.remove_guest_from_occupants(@guest01)
    assert_equal("Ceci", @disney_room.occupants.last.name())
    assert_equal(1, @disney_room.occupants.count())
  end

  def test_find_occupant_by_name()
    @disney_room.add_guest_to_occupants(@guest01)
    @disney_room.add_guest_to_occupants(@guest02)
    guest = @disney_room.find_occupant_by_name("Jaime")
    @disney_room.remove_guest_from_occupants(guest)
    assert_equal("Ceci", @disney_room.occupants.last.name())
    assert_equal(1, @disney_room.occupants.count())
  end

  def test_remove_guest_from_occupants__using_string_name()
    @disney_room.add_guest_to_occupants(@guest01)
    @disney_room.add_guest_to_occupants(@guest02)
    @disney_room.remove_guest_from_occupants("Jaime")
    assert_equal("Ceci", @disney_room.occupants.last.name())
  end

  def test_add_song_to_playlist()
    @disney_room.add_song_to_playlist(@song07)
    assert_equal(3, @disney_room.playlist.count())
    assert_equal("Mazinger Z", @disney_room.playlist.last.title())
  end

  def test_remove_song_from_playlist()
    @disney_room.remove_song_from_playlist(@disney_room.playlist.first)
    assert_equal(1, @disney_room.playlist.count())
  end

  def test_find_song_by_title()
    result = @disney_room.find_song_by_title("A Whole New World")
    assert_equal("A Whole New World", result.title)
  end

  def test_remove_song_from_playlist__using_string_title()
    @disney_room.remove_song_from_playlist("A Whole New World")
    assert_equal(1, @disney_room.playlist.count())
  end

  def test_get_actual_song_being_played()
    result = @disney_room.get_actual_song_being_played()
    assert_equal("A Whole New World", result.title)
  end

  def test_switch_to_next_song()
    assert_equal("A Whole New World", @disney_room.playlist.first.title())
    @disney_room.switch_to_next_song()
    result = @disney_room.get_actual_song_being_played()
    assert_equal("A Friend Like Me", result.title())
  end
end
