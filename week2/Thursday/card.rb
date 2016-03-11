class Card

  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    self.value = infer_value
  end

  def self.suits
    %w(Clubs Spades Hearts Diamonds)
  end

  def self.faces
    %w(2 3 4 5 6 7 8 9 10 J Q K A)
  end

  def infer_value
    self.class.faces.index(face) + 2
  end

  def >(card)
    self.value > card.value
  end

end
