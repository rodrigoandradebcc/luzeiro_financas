class WelcomeController < ApplicationController
  def index
    @companies = Company.all
  	@accounts = Account.all
    @ats = AccountType.all
  	@analytic_accounts = AnalyticAccount.all
  	@synthetic_accounts = SyntheticAccount.all
  end

  def select_account
  		
  end

end
