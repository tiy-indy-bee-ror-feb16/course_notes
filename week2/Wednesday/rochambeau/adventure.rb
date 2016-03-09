class AdventureRochambeau < Game

  attr_accessor :winners

  def initialize
    self.winners = []
  end

  def player_picks
    self.player_one_choice = shoot!
    self.computer = shoot!
  end

  def play
    player_picks
    if player_one_choice == computer
      decision("TIE")
    elsif player_win?
      decision("WINS")
    else
      decision("LOSES")
    end
  end

  def decision(outcome)
    case outcome
    when "TIE"
      winners << "tie"
    when "WINS"
      winners << player_one_choice
    when "LOSES"
      winners << computer
    end
  end

  def bulk_play
    1000.times { play }
    choices.each do |move|
      puts "#{move.upcase} won #{wins(move)} times."
    end
    puts "There were #{wins("tie")} ties."
  end

  def wins(move)
    winners.count(move)
  end

end
