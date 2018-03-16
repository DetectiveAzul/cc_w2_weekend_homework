require_relative '../karaokeControl'
require 'io/console'

karaoke = KaraokeControl.new()

puts "Welcome to OO CodeClan Karaoke Control Software 1.0"
puts "\n"
print "This software is oriented to control your Karaoke business."
print " If in any moment you find this application is not working as"
print " expected to be, please contact our Technical Support line so we can"
print " handle it as faster as possible.\n"
karaoke.clear_screen()

loop do
  puts "What do you want to do, Admin?"
  puts "------------------------------"
  puts "add new (p)laylist"
  puts "check (l)ist of playlists created"
  puts "delete a playlist <work in progress>"
  puts "check (g)uests in waiting room"
  puts "(a)llocate guests in karaoke room <work in progress>"
  puts "(c)reate a new karaoke room"
  puts "check list of (k)araoke rooms"
  puts "(d)isplay karaoke room information"
  puts "delete a room <work in progress>"
  puts "(!!!) ends the application"
  puts "------------------------------"
  puts "Please type your option and press RETURN"
  puts "------------------------------"
  case gets.chomp.downcase
    when "p"
      karaoke.control_creation_playlist()
    when "l"
      karaoke.display_playlists()
    when "g"
      karaoke.display_guests()
    when "a"
      karaoke.allocate_guests()
    when "c"
      karaoke.control_creation_room()
    when "k"
      karaoke.display_rooms()
    when "d"
      karaoke.display_room_information()
    when "!!!"
      break
    else
      puts "That's not a valid option!"
  end
  karaoke.clear_screen()
end
