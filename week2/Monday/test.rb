require 'minitest/autorun'
require_relative 'even_odd_game'
require_relative 'die'
require_relative 'loaded_die'

class Test < MiniTest::Test

  def test_the_truth
    assert true == true, "Um. This should be true"
  end

  def test_maths
    assert 5/2.to_f == 2.5
  end

  class EnumerableTest < Test

    def test_select_is_each
      test_array = [1,2,3,4,5,6]
      container = []
      test_array.each do |num|
        container << num if num.even?
      end
      selected = test_array.select{|num| num.even? }
      assert container == selected
    end

    def test_group_by
      arr_of_hashes = [
        {pilot: "Amy", destination: "Mars"},
        {pilot: "Amy", destination: "Mars"},
        {pilot: "Amy", destination: "Mars"},
        {pilot: "Fry", destination: "Earth"}
      ]
      thing = arr_of_hashes.group_by{|hash| hash[:pilot]}
      p thing.inspect
      assert thing["Amy"].length == 3
    end

  end

  class EvenOddGameTest < Test

    def setup
      @game = EvenOddGame.new
    end

    def test_game_has_two_die
      assert @game.dice.length == 2, "A game should have a pair of dice"
    end

    def test_play
      assert @game.play.is_a? String
    end

    def test_turn
      assert @game.turn.is_a? Fixnum
      assert (2..12).to_a.include? @game.turn
    end

    def test_winning
      @game.stub :turn, 12 do
        assert @game.play == "Win"
      end
    end

    def test_losing
      @game.stub :turn, 11 do
        assert @game.play == "Lose"
      end
    end


  end

  class DieTest < Test

    def setup
      @die = Die.new
    end

    def test_die_sides
      assert @die.sides == 6, "A die should have six sides by default"
    end

    def test_die_roll
      assert (1..6).include? @die.roll
    end

    def test_20_sided_die
      die = Die.new(20)
      assert die.sides == 20, "A D&D die should have 20 sides"
      assert (1..20).include? die.roll
    end

    class LoadedDieTest < DieTest

      def test_loadedness
        die = LoadedDie.new
        rolls = 10000.times.map{ die.roll }
        assert (rolls.count{|num| num == 6}.to_f/rolls.length) > 0.5
      end

    end


  end

end
