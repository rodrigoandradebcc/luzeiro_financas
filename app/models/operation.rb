class Operation < ActiveRecord::Base
	belongs_to :release_account, class_name: "AnalyticAccount"
	belongs_to :retrieve_account, class_name: "AnalyticAccount"

  # shared interface
  belongs_to :operational, polymorphic: true
  
  
  has_many :oldbalances
	after_save :update_balance
  before_update :undo_last_operation
  # before_update :undo_operation
  # after_update :update_balance
  

  validates :value, :only_one_account_per_select_box, :release_date, presence: true

  def only_one_account_per_select_box
    unless retrieve_account != release_account
      errors.add("Contas iguais:", "As contas devem ser diferentes umas das outras")
    end
  end


  def self.id_search(query)
    where("id like ?", "%#{query}%") 
  end



  def self.date_search(init, final)
    # where("created_at between %#{init}% and %#{final}%")
    date1 = Date.strptime(init, "%d/%m/%Y")
    date2 = Date.strptime(final, "%d/%m/%Y")

    where(release_date: date1..date2)
  end

  def result



  end

  
private
  
  
  def undo_last_operation
      op = Operation.find(self)

      value = op.value
      retrieve_value = op.retrieve_account.balance - value 
      release_value = op.release_account.balance + value 
      
      op.release_account.update(balance: release_value)
      op.retrieve_account.update(balance: retrieve_value)

      OldBalance.where(operation: op).delete_all

  end

  def update_balance 
    if self.release_account.second_synthetic_account.synthetic_account.account.account_type.code == 2
      retrieve_value = self.retrieve_account.balance + self.value
      release_value = self.release_account.balance
      
      
    elsif self.retrieve_account.second_synthetic_account.synthetic_account.account.account_type.code == 2
      retrieve_value = self.retrieve_account.balance
      release_value = self.release_account.balance - self.value 
      
    else
      retrieve_value = self.retrieve_account.balance + self.value 
      release_value = self.release_account.balance - self.value 
      
      
     
    end
      self.release_account.update(balance: release_value)
      self.retrieve_account.update(balance: retrieve_value)
      @ob1 = OldBalance.new(operation: self, analytic_account: self.retrieve_account, value: retrieve_value)
      @ob1.save
      @ob2 = OldBalance.new(operation: self, analytic_account: self.release_account, value: release_value)
      @ob2.save
  end
  
end

