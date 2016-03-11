require_relative 'player'

class Game

  attr_accessor :player_one, :player_two, :rounds, :wars

  def initialize
    self.player_one = Player.new("Player One")
    self.player_two = Player.new("Player Two")
    self.rounds = 0
    self.wars = 0
  end

  def play
    until player_one.dry?
      hand
    end
    output_results
    replay?
  end

  def hand
    self.rounds += 1
    card1 = player_one.draw
    card2 = player_two.draw
    pot = [card1, card2]
    if card1 > card2
      player_one.win_cards(pot)
    elsif card2 > card1
      player_two.win_cards(pot)
    else
      self.wars += 1
    end
  end

  def output_results
    winner = [player_one, player_two].max_by{|p| p.winnings.length}
    loser = ([player_one, player_two] - [winner]).first
    if winner.winnings.length == loser.winnings.length
      puts "We had a tie at #{winner.winnings.length}-#{loser.winnings.length} and survived #{wars} wars."
    else
      puts "#{winner.name} won #{winner.winnings.length}-#{loser.winnings.length} and survived #{wars} wars."
    end
  end

  def replay?
    puts "Would you like to play again (y/n)?"
    Game.new.play if STDIN.gets.chomp == "y"
  end

end

Game.new.play
