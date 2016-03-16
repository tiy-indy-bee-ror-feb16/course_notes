require_relative 'card'

class Hand

  attr_accessor :cards, :stayed

  def initialize
    self.cards = []
    self.stayed = false
  end

  def value
    cards.inject(:+)
  end

  def deal(cards)
    self.cards += cards
  end

  def blackjack?
    cards.length == 2 && value == 21
  end

  def busted?
    if value > 21
      switch_aces_as_necessary
    end
    value > 21
  end

  def switch_aces_as_necessary
    until value <= 21 || !available_aces
      available_aces.value = 1
    end
  end

  def available_aces
    cards.detect{|card| card.face == "Ace" && card.value == 11}
  end

  def six_and_safe?
    !busted? && cards.length >= 6
  end

  def >(hand)
    if value == hand.value
      cards.length >= hand.cards.length
    else
      value > hand.value
    end
  end

  def >=(hand)
    self > hand
  end

  def stayed?
    stayed
  end

  def twenty_one?
    value == 21
  end

  def over?
    blackjack? || busted? || six_and_safe? || stayed? || twenty_one?
  end

  def winning?
    blackjack? || six_and_safe?
  end

  def to_s
    cards.map { |card| card.to_s }.join(" and ")
  end

  def coerce(other)
    [other, value]
  end

  def <=>(other)
    value <=> other.value
  end


end
