module Drinkable

  attr_accessor :name,
                :quantity,
                :max_volume,
                :alertness_rise

  def initialize(name, max_volume, alertness_rise=0.31)
    self.name = name
    self.quantity = max_volume
    self.max_volume = max_volume
    self.alertness_rise = alertness_rise
  end

  def drink
    self.quantity -= 1
  end

  def full?
    quantity == max_volume
  end

  def empty?
    quantity == 0
  end

end
