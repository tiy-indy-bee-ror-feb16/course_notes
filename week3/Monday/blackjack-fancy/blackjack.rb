require_relative 'shoe'
require_relative 'hand'
require_relative 'computer_hand'

class Blackjack

  class << self

    attr_accessor :games, :winners


    def games
      @games ||= 0
    end

    def winners
      @winners ||= []
    end

    def streak?
      streak > 2
    end

    def streak
      winners.reverse.take_while{|win| win == "player"}.length
    end

    def mortgage?
      losing_streak > 4
    end

    def losing_streak
      winners.reverse.take_while{|win| win == "dealer"}.length
    end

  end

  attr_accessor :player_hand, :dealer_hand, :shoe

  def initialize
    self.shoe = Shoe.new
    self.player_hand = Hand.new
    self.dealer_hand = ComputerHand.new
  end

  def play(greeting=true)
    self.class.games += 1
    welcome if greeting
    deal_hands
    player_turn unless dealer_hand.blackjack?
    dealer_turn
    winner_winner_chicken_dinner
    live_die_repeat
  end

  def welcome
    puts "Let's play blackjack. [enter]"
    STDIN.gets
  end

  def deal_hands
    player_hand.deal(shoe.draw(2))
    dealer_hand.deal(shoe.draw(2))
  end

  def show_hands(full = false)
    puts "You're holding #{player_hand} and the dealer is showing #{full ? dealer_hand : dealer_hand.show_card}"
  end

  def player_turn
    until player_hand.over?
      show_hands
      puts "Would you like to hit (h) or stay (s)?"
      decision
    end
  end

  def decision
    hs = STDIN.gets.chomp.downcase
    case hs
    when "h"
      player_hand.deal(shoe.draw)
    else
      player_hand.stayed = true
    end
  end

  def dealer_turn
    unless player_hand.blackjack? || player_hand.busted?
      while dealer_hand.hit? && !dealer_hand.over?
        dealer_hand.deal(shoe.draw)
      end
    end
  end

  def winner_winner_chicken_dinner
    show_hands(true)
    puts "#{winner} won."
  end

  def players
    [player_hand, dealer_hand]
  end

  def winner
    if player_winning?
      self.class.winners << "player"
      "You"
    else
      self.class.winners << "dealer"
      "The house"
    end
  end

  def player_winning?
    !player_hand.busted? && (player_hand.winning? || dealer_hand.busted? || player_hand >= dealer_hand)
  end

  def live_die_repeat
    puts "You've won #{self.class.streak} in a row!" if self.class.streak?
    puts "Um. You've lost #{self.class.losing_streak} in a row. Maybe cut your losses?" if self.class.mortgage?
    puts "Would you like to play again? (y/n)"
    puts "#{player_hand.value} vs. #{dealer_hand.value}"
    if STDIN.gets.chomp.downcase == "y"
      Blackjack.new.play(false)
    else
      puts "Thanks for playing!"
      puts "You won #{self.class.winners.count("player")} of #{self.class.games} hands."
    end
  end

end

Blackjack.new.play
