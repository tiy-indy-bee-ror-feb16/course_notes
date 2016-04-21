require 'test_helper'

class TrucksControllerTest < ActionController::TestCase
  setup do
    @truck = trucks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trucks)
  end

  test "should create truck" do
    assert_difference('Truck.count') do
      post :create, truck: { description: @truck.description, food_style: @truck.food_style, name: @truck.name }
    end

    assert_response 201
  end

  test "should show truck" do
    get :show, id: @truck
    assert_response :success
  end

  test "should update truck" do
    put :update, id: @truck, truck: { description: @truck.description, food_style: @truck.food_style, name: @truck.name }
    assert_response 204
  end

  test "should destroy truck" do
    assert_difference('Truck.count', -1) do
      delete :destroy, id: @truck
    end

    assert_response 204
  end
end
