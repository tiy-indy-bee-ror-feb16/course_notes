require_relative 'drinkable'

class Tea

  include Drinkable

  def initialize(name)
    super(name, 3, 0.25)
  end

end
