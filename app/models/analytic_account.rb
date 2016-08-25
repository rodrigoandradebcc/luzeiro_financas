class AnalyticAccount < ActiveRecord::Base
  belongs_to :second_synthetic_account
  
  
  has_many :debits, class_name: "Operation",
                          foreign_key: "retrieve_account_id"
  has_many :credits, class_name: "Operation",
                          foreign_key: "release_account_id"                          
  has_many :oldbalances
  

  def self.operations init, final
    date1 = Date.strptime(init, "%m/%d/%Y")
    date2 = Date.strptime(final, "%m/%d/%Y")
    debit.where(release_date: date1..date2 ) + where(release_date: date1..date2)
    
    
  end

  def old_balance op
  	
  		OldBalance.find_by(operation: op, analytic_account: self)
  end
end
