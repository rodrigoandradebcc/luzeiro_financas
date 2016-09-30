class Result < ActiveRecord::Base
  belongs_to :analytic_account

  has_many :analytic_accounts, as: :listenable
  has_many :operations, as: :operational
  belongs_to :analytic_account


  before_save :set_result_accounts
  after_commit :result_operations
  

  def set_result_accounts
  	Result.transaction do
	  	@account_type = AccountType.find_or_create_by!(code: 2, name: "Passivo")
	  		
	  	@account = Account.find_or_create_by!(account_type: @account_type, code: 2)
	  		
	  	@synthetic_account = SyntheticAccount.find_or_create_by!(account: @account, code: 2)
	  		
	  	@ssyn = SecondSyntheticAccount.find_or_create_by!(synthetic_account: @synthetic_account, code: 2)
		
		if @ssyn.analytic_accounts.any?
			@anal = self.analytic_account = AnalyticAccount.find_or_create_by!(id: @ssyn.analytic_accounts.last.id.next, second_synthetic_account: @ssyn,name: "Resultado do Exercício em: #{self.name}", code: @ssyn.analytic_accounts.last.code.next, description: self.description, balance: self.balance)
		
		else
			@anal = self.analytic_account = AnalyticAccount.find_or_create_by!(id: AnalyticAccount.last.id.next, second_synthetic_account: @ssyn, name: "Resultado do Exercício em: #{self.name}", code: 1, description: self.description, balance: self.balance)
		end
  	end
  end


  	

  	def result_operations 
		self.analytic_accounts.each do |a|
			if a.second_synthetic_account.synthetic_account.account.account_type.code == 3
				 Operation.create(release_date: Time.now, value: -a.balance, retrieve_account: a, release_account: self.analytic_account, description: "Fechamento do exercício findo em #{self.analytic_account.name}" )
				
			elsif a.second_synthetic_account.synthetic_account.account.account_type.code == 4 or a.second_synthetic_account.synthetic_account.account.account_type.code == 5
				 Operation.create(release_date: Time.now,value: a.balance, retrieve_account: self.analytic_account, release_account: a, description: "Fechamento do exercício findo em #{self.analytic_account.name}" )
				
			else  
				raise ActiveRecord::Rollback			
			end
		end
  	end
  	
end