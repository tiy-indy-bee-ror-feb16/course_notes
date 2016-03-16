class Deck

  attr_accessor :cards

  def initialize
    self.cards = Card.suits.inject([]) do |arr, suit|
      arr + Card.faces.map{|f| Card.new(f, suit)}
    end
    shuffle
  end

  def shuffle
    cards.shuffle!
  end

  def refill(new_cards)
    self.cards += new_cards
    shuffle
  end

  def empty?
    cards.empty?
  end

  def deal(num=1)
    hand = cards.shift(num)
    num == 1 ? hand.first : hand
  end

end
