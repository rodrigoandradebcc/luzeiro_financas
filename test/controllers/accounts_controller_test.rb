require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { balance: @account.balance, code: @account.code, credit_balance: @account.credit_balance, debit_balance: @account.debit_balance, description: @account.description, name: @account.name, nature_of_the: @account.nature_of_the }
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    patch :update, id: @account, account: { balance: @account.balance, code: @account.code, credit_balance: @account.credit_balance, debit_balance: @account.debit_balance, description: @account.description, name: @account.name, nature_of_the: @account.nature_of_the }
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to accounts_path
  end
end