require_relative 'deck'

class Player

  attr_accessor :name, :deck, :winnings

  def initialize(name)
    self.name = name
    self.deck = Deck.new
    self.winnings = []
  end

  def dry?
    deck.dry?
  end

  def win_cards(cards)
    self.winnings += cards
  end

  def draw(num=1)
    deck.draw(num)
  end

end
