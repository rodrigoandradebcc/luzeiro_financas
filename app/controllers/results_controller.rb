class ResultsController < ApplicationController
	def index
		if params[:date_init] and params[:date_final]
			@date1 = Date.strptime(params[:date_init], "%m/%d/%Y")
    		@date2 = Date.strptime(params[:date_final], "%m/%d/%Y")
			@credit_accounts = AnalyticAccount.
			joins(:credits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
	    	where(account_types: {code: [3]}).
	    	where(operations: {release_date: @date1..@date2})

	    	@debit_accounts = AnalyticAccount.
	    	joins(:debits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
	    	where(account_types: {code: [4,5]}).where(operations: {release_date: @date1..@date2})
			@date_init = params[:date_init]
			@date_final = params[:date_final]
			@credit_value = 0
			@debit_value = 0
			 @credit_accounts.each{|c|@credit_value+=c.balance}
			 @debit_accounts.each{|d|@debit_value+=d.balance}
	    end
	end

	def result 

		
	end

end
