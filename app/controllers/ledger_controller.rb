class LedgerController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:name]
      @analytic_accounts = AnalyticAccount.name_search(params[:name]).paginate(:page => params[:page], :per_page => 20  )
    else
      @analytic_accounts = AnalyticAccount.paginate(:page => params[:page], :per_page => 20  ).
      includes(second_synthetic_account: {synthetic_account: {account: :account_type}}).
      order('account_types.code').order('accounts.code').order('synthetic_accounts.code').
      order('second_synthetic_accounts.code').order(:code)
    end
    respond_to do |format|
        format.html
        format.pdf do
          render pdf: "file_name"   # Excluding ".pdf" extension.
        end
      end
  end
end
