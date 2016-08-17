class WelcomeController < ApplicationController
  def index
    @companies = Company.all
  	@accounts = Account.all
    @ats = AccountType.all
  	@analytic_accounts = AnalyticAccount.all
  	@synthetic_accounts = SyntheticAccount.all
  	
  	respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

 

  
end
