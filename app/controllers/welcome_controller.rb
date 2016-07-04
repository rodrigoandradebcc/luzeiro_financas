class WelcomeController < ApplicationController
  def index
    @companies = Company.all
  	@accounts = Account.all
  	@analytic_accounts = AnalyticAccount.all
  	@synthetic_accounts = SyntheticAccount.all
  end

 
end
