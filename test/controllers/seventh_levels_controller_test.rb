require 'test_helper'

class SeventhLevelsControllerTest < ActionController::TestCase
  setup do
    @seventh_level = seventh_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seventh_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seventh_level" do
    assert_difference('SeventhLevel.count') do
      post :create, seventh_level: { analytic: @seventh_level.analytic, balance_id: @seventh_level.balance_id, code: @seventh_level.code, name: @seventh_level.name, sixth_level_id: @seventh_level.sixth_level_id }
    end

    assert_redirected_to seventh_level_path(assigns(:seventh_level))
  end

  test "should show seventh_level" do
    get :show, id: @seventh_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seventh_level
    assert_response :success
  end

  test "should update seventh_level" do
    patch :update, id: @seventh_level, seventh_level: { analytic: @seventh_level.analytic, balance_id: @seventh_level.balance_id, code: @seventh_level.code, name: @seventh_level.name, sixth_level_id: @seventh_level.sixth_level_id }
    assert_redirected_to seventh_level_path(assigns(:seventh_level))
  end

  test "should destroy seventh_level" do
    assert_difference('SeventhLevel.count', -1) do
      delete :destroy, id: @seventh_level
    end

    assert_redirected_to seventh_levels_path
  end
end
