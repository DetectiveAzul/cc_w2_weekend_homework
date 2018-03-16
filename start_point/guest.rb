class Guest
  attr_reader :name
  attr_accessor :cash
  def initialize(name, cash)
    @name = name
    @cash = cash
  end
end
