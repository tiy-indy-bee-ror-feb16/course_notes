class Human
  attr_accessor :name,
                :alertness,
                :drink

  def initialize(name, alertness=0)
    self.name = name
    self.alertness = alertness
  end

  def has_coffee?
    drink && !drink.empty?
  end

  def needs_coffee?
    !drink || drink.empty?
  end

  def buy(beverage)
    self.drink = beverage
  end

  def drink!
    self.alertness += drink.alertness_rise
    drink.drink
  end

  def alert?
    alertness > 0.9
  end


end
