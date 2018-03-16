class Room
  attr_reader :number, :size, :entry_fee
  attr_accessor :occupants, :playlist, :till
  def initialize(number, size, playlist=[])
    @number = number
    @size = size
    @playlist = playlist
    @occupants = []
    @entry_fee = 15
    @till = 0
  end

  def add_guest_to_occupants(guest)
    @occupants << guest
  end

  def find_occupant_by_name(occupant_name)
    return @occupants.find { |occupant| occupant.name == occupant_name }
  end

  def remove_guest_from_occupants(guest)
    guest = find_occupant_by_name(guest) if guest.class == String
    @occupants.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

  def find_song_by_title(song_title)
    return @playlist.find { |song| song.title == song_title }
  end

  def remove_song_from_playlist(song)
    song = find_song_by_title(song) if song.class == String
    @playlist.delete(song)
  end

  def get_actual_song_being_played()
    return @playlist.first
  end

  def switch_to_next_song()
    first_song = @playlist.shift
    @playlist << first_song
  end



end
