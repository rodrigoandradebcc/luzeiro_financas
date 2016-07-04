require 'test_helper'

class ChartOfAccountsControllerTest < ActionController::TestCase
  setup do
    @chart_of_account = chart_of_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chart_of_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chart_of_account" do
    assert_difference('ChartOfAccount.count') do
      post :create, chart_of_account: { company_id: @chart_of_account.company_id, title: @chart_of_account.title }
    end

    assert_redirected_to chart_of_account_path(assigns(:chart_of_account))
  end

  test "should show chart_of_account" do
    get :show, id: @chart_of_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chart_of_account
    assert_response :success
  end

  test "should update chart_of_account" do
    patch :update, id: @chart_of_account, chart_of_account: { company_id: @chart_of_account.company_id, title: @chart_of_account.title }
    assert_redirected_to chart_of_account_path(assigns(:chart_of_account))
  end

  test "should destroy chart_of_account" do
    assert_difference('ChartOfAccount.count', -1) do
      delete :destroy, id: @chart_of_account
    end

    assert_redirected_to chart_of_accounts_path
  end
end
