require 'test_helper'

class FirstLevelsControllerTest < ActionController::TestCase
  setup do
    @first_level = first_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_level" do
    assert_difference('FirstLevel.count') do
      post :create, first_level: { balance_id: @first_level.balance_id, chart_of_account_id: @first_level.chart_of_account_id, code: @first_level.code, description: @first_level.description, name: @first_level.name }
    end

    assert_redirected_to first_level_path(assigns(:first_level))
  end

  test "should show first_level" do
    get :show, id: @first_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_level
    assert_response :success
  end

  test "should update first_level" do
    patch :update, id: @first_level, first_level: { balance_id: @first_level.balance_id, chart_of_account_id: @first_level.chart_of_account_id, code: @first_level.code, description: @first_level.description, name: @first_level.name }
    assert_redirected_to first_level_path(assigns(:first_level))
  end

  test "should destroy first_level" do
    assert_difference('FirstLevel.count', -1) do
      delete :destroy, id: @first_level
    end

    assert_redirected_to first_levels_path
  end
end
