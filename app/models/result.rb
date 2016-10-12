class Result < ActiveRecord::Base
  belongs_to :analytic_account, dependent: :destroy

  has_many :analytic_accounts, as: :listenable
  has_many :operations, as: :operational, dependent: :destroy
  


  after_initialize  :set_result_attributes, on: [:create]

  

	def set_result_attributes
		if new_record?
	            @init_date = init.strftime("%d/%m/%Y")
        		@final_date = final.strftime( "%d/%m/%Y")
		self.name = "Resultado do Exercício em: #{@init_date} à #{@final_date}"
		@debit =  AnalyticAccount.result_accounts self.init , self.final, "D"
		@credit = AnalyticAccount.result_accounts self.init , self.final, "C"
		self.balance = @credit.sum(:balance).abs - @debit.sum(:balance).abs

		if self.balance < 0
			self.kind = "D"
		else
			self.kind = "C"
			
		end


		@account_type = AccountType.find_or_create_by!(code: 2, name: "Passivo")

		@account = Account.find_or_create_by!(account_type: @account_type, code: 2)

		@synthetic_account = SyntheticAccount.find_or_create_by!(account: @account, code: 2)

		@ssyn = SecondSyntheticAccount.find_or_create_by!( synthetic_account: @synthetic_account, code: 2)

		if @ssyn.analytic_accounts.any?
		self.analytic_account = AnalyticAccount.new( second_synthetic_account: @ssyn, name: self.name, code: @ssyn.analytic_accounts.last.code.next, description: self.description)

		else
		self.analytic_account = AnalyticAccount.new(second_synthetic_account: @ssyn, name: self.name, code: 1, description: self.description)
		end

		self.analytic_accounts = AnalyticAccount.result_accounts self.init, self.final, "BOTH"
		
		self.analytic_accounts.each do |a|
			if a.second_synthetic_account.synthetic_account.account.account_type.code == 3
				 self.operations <<  Operation.new(release_date: Time.now, value: a.balance.abs, retrieve_account: a, release_account: self.analytic_account, description: "Operação de fechamento do exercício em #{self.analytic_account.name}" )
				
			elsif a.second_synthetic_account.synthetic_account.account.account_type.code == 4 or a.second_synthetic_account.synthetic_account.account.account_type.code == 5
				 self.operations << Operation.new(release_date: Time.now,value: a.balance.abs, retrieve_account: self.analytic_account, release_account: a, description: "Operação de fechamento do exercício em #{self.analytic_account.name}" )
				 
			else  
				false			
			end
		end
		
		self.balance = self.balance.abs
		end
	end



  	

  	# def result_operations 
		
  	# end
  	
end