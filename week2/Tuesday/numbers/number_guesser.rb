class Guesser

  attr_accessor :results

  def initialize(times)
    self.results = []
    bulk_play(times)
  end

  def bulk_play(times)
    times.to_i.times{ round }
  end

  def round
    incorrect = true
    max = range.last
    min = range.first
    guesses = 0
    number_to_guess = range.sample
    last_guess = 0

    while incorrect
      guesses += 1
      p range.inspect
      computer_guess = range[(range.length/2.0).ceil-1]
      if computer_guess == last_guess
        computer_guess = range.max
      end
      last_guess = computer_guess
      if computer_guess > number_to_guess
        max = computer_guess
      elsif computer_guess < number_to_guess
        min = computer_guess
      else
        incorrect = false
      end
      range = (min..max).to_a
    end
    results << guesses
  end
end

results = Guesser.new(ARGV[0] || 10000).results
guesses = results.inject(:+)/results.length
p "On average, it takes me #{guesses} to guess a number between 1 and 1000"
