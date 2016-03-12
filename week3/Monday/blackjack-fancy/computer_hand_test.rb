require 'minitest/autorun'
require_relative 'computer_hand'

class ComputerHandTest < MiniTest::Test

  def setup
    @hand   = ComputerHand.new
    @ace    = Card.new("Ace", "Diamonds")
    @jack   = Card.new("Jack", "Clubs")
    @seven  = Card.new("7", "Spades")
    @two    = Card.new("2", "Hearts")
  end

  def test_hit_if_less_than_16
    @hand.deal([@two, @jack])
    assert @hand.hit?
  end

  def test_stay_if_16
    @hand.deal([@jack, @two, @two, @two])
    refute @hand.hit?
  end

  def test_stay_if_greater_than_16
    @hand.deal([@jack, @seven])
    refute @hand.hit?
  end

  def test_show_card
    @hand.deal([@ace, @seven])
    assert @hand.show_card == @ace
  end

  def assert_ace_acclimation
    @hand.deal([@jack, @ace, @four])
    assert @hand.hit?
    assert @hand.value == 15
  end

end
