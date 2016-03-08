require_relative 'die'

class Bunco

  attr_accessor :round, :total, :dice, :total_rounds

  def initialize
    self.dice = 3.times.map { Die.new }
    self.round = 1
    self.total = 0
    self.total_rounds = 0
  end

  def roll
    dice.map { |die| die.roll }
  end

  def bulk_play
    buncos = 1000000.times.map do
      result = roll.uniq == [round]
      self.round = round == 6 ? 1 : round + 1
      result
    end
    p "In 1,000,000 rounds, we had #{buncos.count(true)} buncos"
    p "On average, that'd be a bunco #{((buncos.count(true)/1000000.to_f)*100).round(4)} percent of the time."
  end

  def play
    self.total_rounds += 1
    intro if total_rounds == 1
    play_round
    total_results
    unless total >= 21
      self.round = round == 6 ? 1 : round + 1
      play
    end
  end

  def intro
    p "Let's play Bunco. Ready? [enter]"
    STDIN.gets
  end

  def roll_results(roll)
    dice_mappings = %w(⚀ ⚁ ⚂ ⚃ ⚄ ⚅)
    roll.map{|r| dice_mappings[r-1]}
  end

  def play_round
    p "This is Round #{round}. Press [enter] to roll"
    STDIN.gets
    numbers = roll
    p "You rolled a #{roll_results(numbers).join(" and ")}."
    if numbers.uniq == [round]
      self.total += 21
    else
      self.total += numbers.count(round)
    end
  end

  def total_results
    p "Your current total is #{total}."
  end

end

if ARGV[0] == "bulk"
  Bunco.new.bulk_play
else
  Bunco.new.play
end
