class ResultsController < ApplicationController
	def index
		if params[:date_init] and params[:date_final]
			@date1 = Date.strptime(params[:date_init], "%m/%d/%Y")
    		@date2 = Date.strptime(params[:date_final], "%m/%d/%Y")
			@credit_accounts = AnalyticAccount.includes(:credits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
	    	where(account_types: {code: [3]}).where(operations: {release_date: @date1..@date2})
	    	@debit_accounts = AnalyticAccount.includes(:debits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
	    	where(account_types: {code: [4,5]}).where(operations: {release_date: @date1..@date2})
	    end
	end	

end
