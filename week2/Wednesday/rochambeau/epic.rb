class EpicRochambeau < Game

  def choices
    %w(rock paper scissors spock lizard)
  end

  def winning_conditions
    super + [
      %w(paper spock),
      %w(rock lizard),
      %w(scissors lizard),
      %w(spock rock),
      %w(spock scissors),
      %w(lizard spock),
      %w(lizard paper)
    ]
  end

  def welcome_message
    "Let's play Rock-Paper-Scissors-Spock-Lizard!"
  end


end
