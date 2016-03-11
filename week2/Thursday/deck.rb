require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    self.cards = []
    make_cards
    shuffle
  end

  def make_cards
    Card.suits.each do |suit|
      Card.faces.each do |face|
        cards << Card.new(face, suit)
      end
    end
  end

  def shuffle
    cards.shuffle!
  end

  def draw(num=1)
    card = cards.shift(num)
    num == 1 ? card.first : card
  end

  def dry?
    cards.empty?
  end

end
