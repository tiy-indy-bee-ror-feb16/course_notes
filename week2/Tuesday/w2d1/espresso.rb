require_relative 'drinkable'

class Espresso

  include Drinkable

  def initialize(name)
    super(name, 1, 0.4)
  end

end
