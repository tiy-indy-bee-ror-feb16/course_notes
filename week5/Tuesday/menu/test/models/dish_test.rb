require 'test_helper'

class DishTest < ActiveSupport::TestCase

  test "picky eaters want veggies and no gluten" do
    bad_dish = Dish.create(vegetarian: true, gluten_free: false)
    refute bad_dish.picky_eater?
    good_dish = Dish.create(vegetarian: true, gluten_free: true)
    assert good_dish.picky_eater?
  end

  test "dishes should have names" do
    bad_dish = Dish.create(vegetarian: true, gluten_free: false)
    refute bad_dish.save
  end

  test "it should have many ingredients" do
    dish = Dish.create(name: "Whatever")
    assert dish.methods.include? :ingredients
    ings = 2.times.map { |num| Ingredient.new(name: "Ing#{num}") }
    ings.each do |ingredient|
      dish.ingredients << ingredient
    end
    assert dish.ingredients.count == 2
  end


end
