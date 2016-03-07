require_relative 'die'

class EvenOddGame

  attr_accessor :dice

  def initialize
    self.dice = [Die.new, Die.new]
  end

  def play
    turn.even? ? "Win" : "Lose"
  end

  def turn
    dice.map{|die| die.roll}.inject(:+)
  end

end
