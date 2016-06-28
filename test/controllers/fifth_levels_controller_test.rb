require 'test_helper'

class FifthLevelsControllerTest < ActionController::TestCase
  setup do
    @fifth_level = fifth_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fifth_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fifth_level" do
    assert_difference('FifthLevel.count') do
      post :create, fifth_level: { analytic: @fifth_level.analytic, balance_id: @fifth_level.balance_id, code: @fifth_level.code, fourth_level_id: @fifth_level.fourth_level_id, name: @fifth_level.name }
    end

    assert_redirected_to fifth_level_path(assigns(:fifth_level))
  end

  test "should show fifth_level" do
    get :show, id: @fifth_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fifth_level
    assert_response :success
  end

  test "should update fifth_level" do
    patch :update, id: @fifth_level, fifth_level: { analytic: @fifth_level.analytic, balance_id: @fifth_level.balance_id, code: @fifth_level.code, fourth_level_id: @fifth_level.fourth_level_id, name: @fifth_level.name }
    assert_redirected_to fifth_level_path(assigns(:fifth_level))
  end

  test "should destroy fifth_level" do
    assert_difference('FifthLevel.count', -1) do
      delete :destroy, id: @fifth_level
    end

    assert_redirected_to fifth_levels_path
  end
end
