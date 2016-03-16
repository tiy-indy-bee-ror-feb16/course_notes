class Card

  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    self.value = set_value
  end

  def self.suits
    %w(Clubs Spades Diamonds Hearts)
  end

  def self.faces
    (2..10).to_a + %w(Jack Queen King Ace)
  end

  def self.value_map
    {
      "Ace"   => 11,
      "King"  => 10,
      "Queen" => 10,
      "Jack"  => 10
    }
  end

  def set_value
    self.class.value_map[face] || face.to_i
  end

  def +(card)
    value + card.value
  end

  def coerce(other)
    [other, value]
  end

  def to_s
    "a #{face} of #{suit}"
  end


end
