class Die

  attr_accessor :sides

  def initialize(sides=6)
    self.sides = sides
  end

  def roll
    rand(1..sides)
  end

end
