require 'test_helper'

class AnalyticAccountsControllerTest < ActionController::TestCase
  setup do
    @analytic_account = analytic_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analytic_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analytic_account" do
    assert_difference('AnalyticAccount.count') do
      post :create, analytic_account: { balance: @analytic_account.balance, code: @analytic_account.code, description: @analytic_account.description, name: @analytic_account.name, synthetic_account_id: @analytic_account.synthetic_account_id }
    end

    assert_redirected_to analytic_account_path(assigns(:analytic_account))
  end

  test "should show analytic_account" do
    get :show, id: @analytic_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @analytic_account
    assert_response :success
  end

  test "should update analytic_account" do
    patch :update, id: @analytic_account, analytic_account: { balance: @analytic_account.balance, code: @analytic_account.code, description: @analytic_account.description, name: @analytic_account.name, synthetic_account_id: @analytic_account.synthetic_account_id }
    assert_redirected_to analytic_account_path(assigns(:analytic_account))
  end

  test "should destroy analytic_account" do
    assert_difference('AnalyticAccount.count', -1) do
      delete :destroy, id: @analytic_account
    end

    assert_redirected_to analytic_accounts_path
  end
end
