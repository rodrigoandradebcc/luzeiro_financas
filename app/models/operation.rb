class Operation < ActiveRecord::Base
	belongs_to :release_account, class_name: "AnalyticAccount"
	belongs_to :retrieve_account, class_name: "AnalyticAccount"

	after_create :update_balance
  # before_update :undo_operation
  # after_update :update_balance
  after_destroy :undo_operation

private

 

  def update_balance
  	release_value = self.release_account.balance - self.value
  	retrieve_value = self.retrieve_account.balance + self.value
    
    self.release_account.update(balance: release_value)
    self.retrieve_account.update(balance: retrieve_value)

  end

   def undo_operation
    release_value = self.release_account.balance + self.value
    retrieve_value = self.retrieve_account.balance - self.value
    
    self.release_account.update(balance: release_value)
    self.retrieve_account.update(balance: retrieve_value)
  end
end

