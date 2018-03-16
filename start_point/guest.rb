class Guest
  attr_reader :name
  attr_accessor :cash
  def initialize(name, cash, fave_song = nil)
    @name = name
    @cash = cash
    @fave_song = fave_song
  end

  def enough_money?(entry_fee)
    return @cash >= entry_fee
  end

  def pay_entry_fee(entry_fee)
    if enough_money?(entry_fee)
      @cash -= entry_fee
      return true
    end
    return false
  end

  def check_favourite_song_in_playlist(playlist)
    return "Wow, pal, that's my song!" if playlist.include?(@fave_song)
    return nil
  end

end
