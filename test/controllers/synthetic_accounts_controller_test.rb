require 'test_helper'

class SyntheticAccountsControllerTest < ActionController::TestCase
  setup do
    @synthetic_account = synthetic_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synthetic_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synthetic_account" do
    assert_difference('SyntheticAccount.count') do
      post :create, synthetic_account: { account_id: @synthetic_account.account_id, balance: @synthetic_account.balance, code: @synthetic_account.code, description: @synthetic_account.description, name: @synthetic_account.name }
    end

    assert_redirected_to synthetic_account_path(assigns(:synthetic_account))
  end

  test "should show synthetic_account" do
    get :show, id: @synthetic_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @synthetic_account
    assert_response :success
  end

  test "should update synthetic_account" do
    patch :update, id: @synthetic_account, synthetic_account: { account_id: @synthetic_account.account_id, balance: @synthetic_account.balance, code: @synthetic_account.code, description: @synthetic_account.description, name: @synthetic_account.name }
    assert_redirected_to synthetic_account_path(assigns(:synthetic_account))
  end

  test "should destroy synthetic_account" do
    assert_difference('SyntheticAccount.count', -1) do
      delete :destroy, id: @synthetic_account
    end

    assert_redirected_to synthetic_accounts_path
  end
end
