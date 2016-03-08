require_relative 'drinkable'

class Coffee

  include Drinkable

  def initialize(name)
    super(name, 3)
  end

end
