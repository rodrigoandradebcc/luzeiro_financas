require 'test_helper'

class SubelementsControllerTest < ActionController::TestCase
  setup do
    @subelement = subelements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subelements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subelement" do
    assert_difference('Subelement.count') do
      post :create, subelement: { code: @subelement.code, name: @subelement.name }
    end

    assert_redirected_to subelement_path(assigns(:subelement))
  end

  test "should show subelement" do
    get :show, id: @subelement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subelement
    assert_response :success
  end

  test "should update subelement" do
    patch :update, id: @subelement, subelement: { code: @subelement.code, name: @subelement.name }
    assert_redirected_to subelement_path(assigns(:subelement))
  end

  test "should destroy subelement" do
    assert_difference('Subelement.count', -1) do
      delete :destroy, id: @subelement
    end

    assert_redirected_to subelements_path
  end
end
