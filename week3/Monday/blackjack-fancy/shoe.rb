require_relative 'deck'

class Shoe < Deck

  def populate
    7.times { super }
  end

end
