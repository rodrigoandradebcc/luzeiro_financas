class WelcomeController < ApplicationController
  def index
  
  	@analytic_accounts = AnalyticAccount.paginate(:page => params[:page], :per_page => 20  ).
      includes(second_synthetic_account: {synthetic_account: {account: :account_type}}).
      order('account_types.code').order('accounts.code').order('synthetic_accounts.code').
      order('second_synthetic_accounts.code').order(:code)
  	respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

 

  
end
