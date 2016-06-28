require 'test_helper'

class FourthLevelsControllerTest < ActionController::TestCase
  setup do
    @fourth_level = fourth_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fourth_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fourth_level" do
    assert_difference('FourthLevel.count') do
      post :create, fourth_level: { analytic: @fourth_level.analytic, balance_id: @fourth_level.balance_id, code: @fourth_level.code, name: @fourth_level.name, third_level_id: @fourth_level.third_level_id }
    end

    assert_redirected_to fourth_level_path(assigns(:fourth_level))
  end

  test "should show fourth_level" do
    get :show, id: @fourth_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fourth_level
    assert_response :success
  end

  test "should update fourth_level" do
    patch :update, id: @fourth_level, fourth_level: { analytic: @fourth_level.analytic, balance_id: @fourth_level.balance_id, code: @fourth_level.code, name: @fourth_level.name, third_level_id: @fourth_level.third_level_id }
    assert_redirected_to fourth_level_path(assigns(:fourth_level))
  end

  test "should destroy fourth_level" do
    assert_difference('FourthLevel.count', -1) do
      delete :destroy, id: @fourth_level
    end

    assert_redirected_to fourth_levels_path
  end
end
