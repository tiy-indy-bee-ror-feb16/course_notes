class Die

  attr_accessor :sides

  def initialize(sides=6)
    self.sides = sides
  end

  def roll
    (1..sides).to_a.sample
  end

end
