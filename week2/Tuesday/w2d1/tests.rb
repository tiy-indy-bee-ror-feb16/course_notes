require 'minitest/autorun'
require 'minitest/pride'

require './human'
require './espresso'
require './coffee'
require './tea'

class CaffeineTest < MiniTest::Test
  def test_humans_tend_to_be_sleepy
    tyler = Human.new "Tyler"
    assert tyler.alertness < 0.1
  end

  def test_humans_need_coffee
    randy = Human.new "Randy"
    refute randy.has_coffee?
    assert randy.needs_coffee?
  end

  def test_humans_can_drink_coffee
    sherri = Human.new "Sherri"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    assert tsmf.full?

    sherri.buy tsmf
    sherri.drink!
    assert(sherri.alertness.between?(0.1, 0.33))
    refute sherri.alert?
    refute tsmf.full?
    refute tsmf.empty?, "Coffee has a quantity of #{tsmf.quantity}"
  end

  def test_humans_can_drink_all_the_coffee
    trevor = Human.new "Trevor"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    trevor.buy tsmf

    3.times { trevor.drink! }
    assert tsmf.empty?
    assert trevor.alert?
  end

  def test_a_human_with_coffee_doesnt_need_coffee
    charles = Human.new "Charles"
    coffee = Coffee.new "Americano"
    charles.buy coffee
    refute charles.needs_coffee?, "Charles #{charles.needs_coffee?}"
  end

  def test_a_human_with_an_empty_drink_needs_coffee
    charles = Human.new "Charles"
    coffee = Coffee.new "Americano"
    charles.buy coffee
    3.times { charles.drink! }
    assert charles.needs_coffee?
  end

  def test_espresso_has_one_shot
    chuck = Human.new "Chuck"
    coffee = Espresso.new "Tall"
    chuck.buy coffee
    chuck.drink!
    assert coffee.empty?
    assert chuck.alertness == 0.4
    refute chuck.alert?
  end

  def test_tea_alertness_and_servings
    leah = Human.new "Leah"
    tea = Tea.new "Earl Grey"
    leah.buy tea
    leah.drink!
    assert leah.alertness == 0.25
    refute tea.empty?
    refute leah.alert?
  end

end
