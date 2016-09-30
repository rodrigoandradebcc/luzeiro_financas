module AnalyticAccountsHelper
	def parent_accounts
		@accounts = SecondSyntheticAccount.all
		
	end
	
end
