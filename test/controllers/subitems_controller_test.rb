require 'test_helper'

class SubitemsControllerTest < ActionController::TestCase
  setup do
    @subitem = subitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subitem" do
    assert_difference('Subitem.count') do
      post :create, subitem: { code: @subitem.code, name: @subitem.name }
    end

    assert_redirected_to subitem_path(assigns(:subitem))
  end

  test "should show subitem" do
    get :show, id: @subitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subitem
    assert_response :success
  end

  test "should update subitem" do
    patch :update, id: @subitem, subitem: { code: @subitem.code, name: @subitem.name }
    assert_redirected_to subitem_path(assigns(:subitem))
  end

  test "should destroy subitem" do
    assert_difference('Subitem.count', -1) do
      delete :destroy, id: @subitem
    end

    assert_redirected_to subitems_path
  end
end
