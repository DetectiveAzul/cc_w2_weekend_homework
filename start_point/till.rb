class Till
  attr_accessor :cash
  def initialize(cash = 0)
    @cash = cash
  end

  def insert_money(amount)
    @cash += amount
  end
end
