require 'test_helper'

class ThirdLevelsControllerTest < ActionController::TestCase
  setup do
    @third_level = third_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:third_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create third_level" do
    assert_difference('ThirdLevel.count') do
      post :create, third_level: { code: @third_level.code, name: @third_level.name, second_level_id: @third_level.second_level_id }
    end

    assert_redirected_to third_level_path(assigns(:third_level))
  end

  test "should show third_level" do
    get :show, id: @third_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @third_level
    assert_response :success
  end

  test "should update third_level" do
    patch :update, id: @third_level, third_level: { code: @third_level.code, name: @third_level.name, second_level_id: @third_level.second_level_id }
    assert_redirected_to third_level_path(assigns(:third_level))
  end

  test "should destroy third_level" do
    assert_difference('ThirdLevel.count', -1) do
      delete :destroy, id: @third_level
    end

    assert_redirected_to third_levels_path
  end
end
