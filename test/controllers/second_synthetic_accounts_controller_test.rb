require 'test_helper'

class SecondSyntheticAccountsControllerTest < ActionController::TestCase
  setup do
    @second_synthetic_account = second_synthetic_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_synthetic_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_synthetic_account" do
    assert_difference('SecondSyntheticAccount.count') do
      post :create, second_synthetic_account: { balance: @second_synthetic_account.balance, code: @second_synthetic_account.code, description: @second_synthetic_account.description, name: @second_synthetic_account.name, synthetic_account_id: @second_synthetic_account.synthetic_account_id }
    end

    assert_redirected_to second_synthetic_account_path(assigns(:second_synthetic_account))
  end

  test "should show second_synthetic_account" do
    get :show, id: @second_synthetic_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_synthetic_account
    assert_response :success
  end

  test "should update second_synthetic_account" do
    patch :update, id: @second_synthetic_account, second_synthetic_account: { balance: @second_synthetic_account.balance, code: @second_synthetic_account.code, description: @second_synthetic_account.description, name: @second_synthetic_account.name, synthetic_account_id: @second_synthetic_account.synthetic_account_id }
    assert_redirected_to second_synthetic_account_path(assigns(:second_synthetic_account))
  end

  test "should destroy second_synthetic_account" do
    assert_difference('SecondSyntheticAccount.count', -1) do
      delete :destroy, id: @second_synthetic_account
    end

    assert_redirected_to second_synthetic_accounts_path
  end
end
