require 'minitest/autorun'
require_relative 'shoe'

class ShoeTest < MiniTest::Test

  def setup
    @shoe = Shoe.new
  end

  def test_a_shoe_is_seven_decks
    assert @shoe.length == 52 * 7
  end

  def test_a_shoe_is_shuffled_throughout
    assert @shoe.each_slice(52).map{|deck| deck.map{|card| card.to_s}.sort}.uniq.length == 7
  end

end
