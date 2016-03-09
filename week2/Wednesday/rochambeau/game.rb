class Game

  attr_accessor :player_one_choice, :computer

  def initialize
    self.player_one_choice = ""
    self.computer = shoot!
  end

  def choices
    %w(rock paper scissors)
  end

  def shoot!
    choices.sample
  end

  def play
    intro
    if player_one_choice == computer
      decision("TIE")
    elsif player_win?
      decision("WINS")
    else
      decision("LOSES")
    end
  end

  def winning_conditions
    [
      %w(paper rock),
      %w(scissors paper),
      %w(rock scissors)
    ]
  end

  def player_win?
    winning_conditions.include? [player_one_choice, computer]
  end

  def intro
    puts welcome_message
    until choices.include? player_one_choice
      puts "Pick one of #{choices.join(" or ")}"
      self.player_one_choice = STDIN.gets.chomp
    end
  end

  def welcome_message
    "Let's play Rochambeau!"
  end

  def decision(outcome)
    puts "Player: #{player_one_choice.upcase} vs Computer: #{computer.upcase} ----- PLAYER #{outcome}"
  end

end
