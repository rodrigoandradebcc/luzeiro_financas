class Operation < ActiveRecord::Base
  belongs_to :release_account, class_name: "AnalyticAccount"
  belongs_to :retrieve_account, class_name: "AnalyticAccount"
  # shared interface
  belongs_to :operational, polymorphic: true
  has_many :old_balances, dependent: :destroy
  validates :value, :release_date, presence: true
  validate :only_one_account_per_select_box
  before_destroy :undo_last_operation
  after_save :create_balance


  def only_one_account_per_select_box
    unless retrieve_account != release_account
      errors.add("Contas iguais:", "As contas devem ser diferentes umas das outras")
    end
  end



  def self.date_search(init, final)
    # where("created_at between %#{init}% and %#{final}%")
    date1 = Date.strptime(init, "%d/%m/%Y")
    date2 = Date.strptime(final, "%d/%m/%Y")

    where(release_date: date1..date2)
  end

   # desfaz operação anterior e as contas
   # antes de atualizar a operação
  

  # atualiza os old_balances e as contas após atualizar a operação
  
  private

  def create_balance
    unless destroyed?
      
      retrieve_value = self.retrieve_account.balance + self.value 
      release_value = self.release_account.balance - self.value
      
      # if self.release_account.result
      #    self.release_account.update(balance: release_value.abs)
         
      # elsif self.retrieve_account.result
      #    self.release_account.update(balance: release_value) 
      #    self.retrieve_account.update(balance: retrieve_value.abs) 
      # else
        self.release_account.update(balance: release_value) 
        self.retrieve_account.update(balance: retrieve_value) 
      # end      
      
      retrieve_ob  = OldBalance.new(operation: self, analytic_account: self.retrieve_account, value:  retrieve_value)
      release_ob = OldBalance.new(operation: self, analytic_account: self.release_account, value: release_value)  
      retrieve_ob.save!
      release_ob.save!
    end
  end

  def undo_last_operation
    # if self.operational
    #   retrieve_balance =  self.retrieve_account.balance + self.value
    #   release_balance = self.release_account.balance - self.value
    # else
      retrieve_balance =  self.retrieve_account.balance - self.value
      release_balance = self.release_account.balance + self.value
    # end
   
    self.retrieve_account.update(balance: retrieve_balance)
    self.release_account.update(balance: release_balance)
  end

  # def validate_value release_ob=nil, retrieve_ob=nil
  #     if release_ob
  #       release_balance = release_anal.balance + release_ob.value
      
  #     elsif retrieve_ob
  #       if retrieve_ob.balance < 0
  #        retrieve_balance =  retrieve_anal.balance - release_ob.value
  #       else
  #         retrieve_balance = retrieve_anal.balance - retrieve_ob.value
  #       end
  #     end
     
    
  # end


end

