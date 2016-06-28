require 'test_helper'

class SecondLevelsControllerTest < ActionController::TestCase
  setup do
    @second_level = second_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_level" do
    assert_difference('SecondLevel.count') do
      post :create, second_level: { balance_id: @second_level.balance_id, code: @second_level.code, name: @second_level.name }
    end

    assert_redirected_to second_level_path(assigns(:second_level))
  end

  test "should show second_level" do
    get :show, id: @second_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_level
    assert_response :success
  end

  test "should update second_level" do
    patch :update, id: @second_level, second_level: { balance_id: @second_level.balance_id, code: @second_level.code, name: @second_level.name }
    assert_redirected_to second_level_path(assigns(:second_level))
  end

  test "should destroy second_level" do
    assert_difference('SecondLevel.count', -1) do
      delete :destroy, id: @second_level
    end

    assert_redirected_to second_levels_path
  end
end
