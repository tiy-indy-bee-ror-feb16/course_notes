require_relative 'game'
require_relative 'adventure'
require_relative 'epic'

if ARGV[0] == "sim"
  AdventureRochambeau.new.bulk_play
elsif ARGV[0] == "SPOCK"
  EpicRochambeau.new.play
else
  Game.new.play
end
