class Room
  attr_reader :number
  attr_accessor :occupants, :playlist
  def initialize(number, playlist=[])
    @number = number
    @playlist = playlist
    @occupants = []
  end

end
