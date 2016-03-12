require 'minitest/autorun'
require_relative 'blackjack'

class BlackjackTest < MiniTest::Test

  def setup
    @game = Blackjack.new(false)
    @ace = Card.new("Ace", "Diamonds")
    @jack = Card.new("Jack", "Clubs")
    @two = Card.new("2", "Hearts")
    @seven = Card.new("7", "Spades")
    @game.class.winners = []
    @game.class.games = 0
  end

  def test_blackjack_dealer_wins
    @game.player_hand.deal([@ace, @jack])
    @game.dealer_hand.deal([@ace, @jack])
    assert @game.winner == "The house"
    assert @game.class.winners == ["dealer"]
    assert @game.class.games = 1
  end

  def test_player_blackjack_wins
    @game.player_hand.deal([@ace, @jack])
    @game.dealer_hand.deal([@jack, @two, @two, @two])
    assert @game.winner == "You"
    assert @game.class.winners == ["player"]
  end

  def test_streak
    @game.class.winners = %w(player player player player dealer player).reverse
    assert @game.class.streak?
    assert @game.class.streak == 4
  end

  def test_mortgage
    @game.class.winners = %w(delear player dealer dealer dealer dealer dealer)
    assert @game.class.mortgage?, "#{@game.class.mortgage?}"
    assert @game.class.losing_streak == 5, @game.class.losing_streak
  end

  def test_deal_hands
    @game.deal_hands
    assert @game.player_hand.cards.length == 2
    assert @game.dealer_hand.cards.length == 2
    refute @game.player_hand.busted?
    refute @game.dealer_hand.busted?
  end

  def test_hit
    @game.deal_hands
    @game.decision("h")
    assert @game.player_hand.cards.length == 3
    @game.decision("s")
    assert @game.player_hand.cards.length == 3
  end

  def test_show_hands
    @game.player_hand.deal([@ace, @jack])
    @game.dealer_hand.deal([@jack, @two])
    assert @game.show_hands == "You're holding a Ace of Diamonds and a Jack of Clubs and The Dealer is showing a Jack of Clubs", "#{@game.show_hands}"
    assert @game.show_hands(true) == "You're holding a Ace of Diamonds and a Jack of Clubs and The Dealer is showing a Jack of Clubs and a 2 of Hearts", "#{@game.show_hands(true)}"
  end

  def test_dealer_turn
    @game.player_hand.deal([@jack, @seven])
    @game.dealer_hand.deal([@jack, @two])
    @game.dealer_turn
    assert @game.dealer_hand.cards.length > 2
  end

end
