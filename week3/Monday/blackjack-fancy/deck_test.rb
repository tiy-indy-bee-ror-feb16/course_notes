require 'minitest/autorun'
require_relative 'deck'

class DeckTest < MiniTest::Test

  def setup
    @deck = Deck.new
  end

  def test_that_a_deck_has_52_cards
    assert @deck.length == 52
  end

  def test_that_decks_get_shuffled
    deck2 = Deck.new
    assert @deck.map{|card| card.to_s} != deck2.map{|card| card.to_s}
  end

  def test_can_draw_a_card_from_a_deck
    draw_assertions(@deck.draw, 1)
  end

  def test_can_draw_multiple_cards_from_a_deck
    draw_assertions(@deck.draw(2), 2)
  end

  private

  def draw_assertions(draw, num)
    assert draw.is_a? Array
    assert draw.all? {|c| c.is_a? Card}
    assert draw.length == num
    assert @deck.length == 52 - num
  end


end
