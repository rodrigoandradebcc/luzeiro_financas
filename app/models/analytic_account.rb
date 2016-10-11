class AnalyticAccount < ActiveRecord::Base
  belongs_to :second_synthetic_account
  
  belongs_to :listenable, polymorphic: true
  
  has_many :debits, class_name: "Operation",
                          foreign_key: "retrieve_account_id", dependent: :destroy
  has_many :credits, class_name: "Operation",
                          foreign_key: "release_account_id", dependent: :destroy                        
  has_many :old_balances
  
  has_one :result
  def self.debits
    
    debit.where(release_date: date1..date2 )
      
  end

  def self.credits
    
    credit.where(release_date: date1..date2 )
      
  end

  def self.order_by_code
      includes(second_synthetic_account: {synthetic_account: {account: :account_type}}).
      order('account_types.code').order('accounts.code').order('synthetic_accounts.code').
      order('second_synthetic_accounts.code').order(:code)
    
  end
  
  def self.result_accounts date_init, date_final, nature
      
      if date_init.class.equal?Date and date_final.class.equal?Date
        @init_date = date_init
        @final_date = date_final
      else
        @init_date = Date.strptime(date_init, "%d/%m/%Y")
        @final_date = Date.strptime(date_final, "%d/%m/%Y") 
      end

      if nature.eql?"D"
        
        includes(:debits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [4,5]}).
        where(operations: {release_date: @init_date..@final_date})

      elsif nature.eql?"C"
        
        includes(:credits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [3]}).where(operations: {release_date: @init_date..@final_date}).
        where.not(second_synthetic_accounts: {code: [2]})
      elsif nature.eql?"BOTH"
        
        credits = includes(:debits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [4,5]}).
        where(operations: {release_date: @init_date..@final_date})
        debits = includes(:credits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [3]}).where(operations: {release_date: @init_date..@final_date}).
        where.not(second_synthetic_accounts: {code: [2]})
        credits + debits
      else
        nil
      end        
  end

  def analytic_account_name
    "#{second_synthetic_account.synthetic_account.account.account_type.code}.
    #{second_synthetic_account.synthetic_account.account.code}.
    #{second_synthetic_account.synthetic_account.code}.
    #{second_synthetic_account.code}.
    #{code} - #{name}"
      
  end

  def old_balance op
  	
  		OldBalance.find_by(operation: op, analytic_account: self)
  end

end
