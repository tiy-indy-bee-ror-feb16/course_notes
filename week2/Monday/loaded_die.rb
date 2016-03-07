require_relative 'die'

class LoadedDie < Die

  def roll
    ((1..sides).to_a + [6,6,6,6,6,6,6,6,6,6,6,6]).sample
  end

end
