require_relative 'room'
require_relative 'song'
require_relative 'till'
require_relative 'guest'

class KaraokeControl
  attr_accessor :rooms, :playlists, :guests
  def initialize()
    @rooms = []
    @playlists = []
    @guests = []
  end

  def control_creation_playlist()
    puts "How many songs you want to add to the new playlist?"
    input = gets.chomp.to_i
    song_title_array = []
    input.times do
      puts "Input song title"
      song = gets.chomp
      song_title_array << song
        end
    create_playlist(song_title_array)
  end

  def create_playlist(song_title_array)
    new_playlist = []
    for song_title in song_title_array
      new_playlist << Song.new(song_title)
    end
    @playlists << new_playlist
  end

  def create_till(amount_on_till = 0)
    return Till.new(amount_on_till)
  end

  def control_creation_room()
    if @playlists.empty?
      puts "Please, create a playlist first"
    else
      puts "How many guests can the room acomodate?"
      size = gets.chomp
      puts "Which playlist will this room use?"
      puts "If you input an incorrect number, the last created playlist will be used."
      playlist_number = gets.chomp.to_i
      playlist_number = @playlists.length-1 if @playlists[playlist_number] == nil
      puts "How much money there is in the till?"
      amount_on_till = gets.chomp.to_i
      add_new_room(size, @playlists[playlist_number], amount_on_till)
    end
  end

  def add_new_room(size, playlist, amount_on_till)
    number = @rooms.count()
    till = Till.new(amount_on_till)
    new_room = Room.new(number, size, till, playlist)
    @rooms << new_room
    @playlists.delete(playlist)
  end

  def create_guest(name, cash, fave_song=nil)
    fave_song = Song.new(fave_song) if fave_song != nil
    @guests << Guest.new(name, cash, fave_song)
  end

  def display_guests()
    if @guests != []
      for guest in @guests
        puts {"Guest #{guest.name} is waiting to enter a room"}
      end
    else
      puts "There are no Guests in the waiting room"
    end
  end

  def display_rooms()
    if @rooms != []
      puts "You have created the following rooms"
      rooms.each do |room|
        puts "\n"
        puts "Room number #{room.number}"
        puts "--------------------------"
        room.playlist.each_with_index do |song, index|
          puts "Song #{index}: #{song.title}"
          end
      end
    else
      puts "You have not created Karaoke rooms"
    end
  end

  def display_room_information()
    puts "Input Room number"
    index = gets.chomp.to_i
    room = @rooms[index]
    if room

      puts "Room number #{index}"
      puts "--------------------"
      playlist_string = []
      room.playlist.each { |song| playlist_string << song.title }
      puts "Songs in the list: #{playlist_string.join(", ")}"
      puts "Playing now song: #{room.playlist.first.title}"
      puts "Size: #{room.size}"
      puts "Till: #{room.till.cash}"
      occupants_string = []
      room.occupants.each { |occupant| occupants_string << occupant.name }
      puts "Occupants: #{occupants_string.join(", ")}"
      puts "Entry Fee: #{room.entry_fee}"
    else
      puts "That room does not exist"
    end
  end

  def display_playlists()
    if @playlists != []
      puts "The following playlists hasn't been assigned yet"
      @playlists.each_with_index do |playlist, index|
        puts "\n"
        puts "Playlist on index '#{index}' contains the following songs:"
        puts "\n"
        playlist.each_with_index do |song, index|
          puts "#{index}: #{song.title}"
        end
      end
    else
      puts "There are no unassigned playlists"
    end
  end

  def clear_screen()
    puts "\nPress Any Key To Continue"
    STDIN.getch
    system "clear" or system "cls"
  end

end
