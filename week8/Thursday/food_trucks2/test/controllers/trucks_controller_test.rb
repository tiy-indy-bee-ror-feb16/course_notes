require 'test_helper'

class TrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @truck = trucks(:one)
  end

  test "should get index" do
    get trucks_url
    assert_response :success
  end

  test "should create truck" do
    assert_difference('Truck.count') do
      post trucks_url, params: { truck: { description: @truck.description, food_style: @truck.food_style, name: @truck.name } }
    end

    assert_response 201
  end

  test "should show truck" do
    get truck_url(@truck)
    assert_response :success
  end

  test "should update truck" do
    patch truck_url(@truck), params: { truck: { description: @truck.description, food_style: @truck.food_style, name: @truck.name } }
    assert_response 200
  end

  test "should destroy truck" do
    assert_difference('Truck.count', -1) do
      delete truck_url(@truck)
    end

    assert_response 204
  end
end
