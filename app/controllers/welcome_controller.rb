class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    
    respond_to do |format|
      format.html
      format.pdf do
        @analytic_accounts = AnalyticAccount.
        includes(second_synthetic_account: {synthetic_account: {account: :account_type}}).
        order('account_types.code').order('accounts.code').order('synthetic_accounts.code').
        order('second_synthetic_accounts.code').order(:code)
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end
end