class AnalyticAccount < ActiveRecord::Base
  belongs_to :second_synthetic_account
  
  
  has_many :debits, class_name: "Operation",
                          foreign_key: "retrieve_account_id"
  has_many :credits, class_name: "Operation",
                          foreign_key: "release_account_id"                          
  has_many :oldbalances
  

  def operations

  		self.credits + self.debits

  end

  def self.date_search(init, final)
    # where("created_at between %#{init}% and %#{final}%")
    date1 = Date.strptime(init, "%m/%d/%Y")
    date2 = Date.strptime(final, "%m/%d/%Y")
    includes(second_synthetic_account: {synthetic_account: {account: :account_type}}).where(account_types: {code: [3,4,5]}, created_at: date1.beginning_of_day..date2.end_of_day)
    
  end


  def old_balance op
  	
  		OldBalance.find_by(operation: op, analytic_account: self)
  end
end
