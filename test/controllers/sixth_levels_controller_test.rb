require 'test_helper'

class SixthLevelsControllerTest < ActionController::TestCase
  setup do
    @sixth_level = sixth_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sixth_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sixth_level" do
    assert_difference('SixthLevel.count') do
      post :create, sixth_level: { analytic: @sixth_level.analytic, balance_id: @sixth_level.balance_id, code: @sixth_level.code, fifth_level_id: @sixth_level.fifth_level_id, name: @sixth_level.name }
    end

    assert_redirected_to sixth_level_path(assigns(:sixth_level))
  end

  test "should show sixth_level" do
    get :show, id: @sixth_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sixth_level
    assert_response :success
  end

  test "should update sixth_level" do
    patch :update, id: @sixth_level, sixth_level: { analytic: @sixth_level.analytic, balance_id: @sixth_level.balance_id, code: @sixth_level.code, fifth_level_id: @sixth_level.fifth_level_id, name: @sixth_level.name }
    assert_redirected_to sixth_level_path(assigns(:sixth_level))
  end

  test "should destroy sixth_level" do
    assert_difference('SixthLevel.count', -1) do
      delete :destroy, id: @sixth_level
    end

    assert_redirected_to sixth_levels_path
  end
end
