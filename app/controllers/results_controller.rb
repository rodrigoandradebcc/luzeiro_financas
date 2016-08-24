class ResultsController < ApplicationController
	def index

	
    if params[:date_init] and params[:date_final]
      
      @accounts = AnalyticAccount.date_search(params[:date_init], params[:date_final])
    else
      @accounts = AnalyticAccount.includes(second_synthetic_account: {synthetic_account: {account: :account_type}}).where(account_types: {code: [3,4,5]})
    end
	end	

end
