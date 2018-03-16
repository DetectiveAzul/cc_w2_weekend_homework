class Room
  attr_reader :number
  attr_accessor :occupants, :playlist
  def initialize(number, playlist=[])
    @number = number
    @playlist = playlist
    @occupants = []
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


end
