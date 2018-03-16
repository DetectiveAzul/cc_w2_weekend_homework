class Guest
  attr_reader :name
  attr_accessor :cash
  def initialize(name, cash)
    @name = name
    @cash = cash
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
end
