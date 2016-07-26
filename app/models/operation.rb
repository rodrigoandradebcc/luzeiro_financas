class Operation < ActiveRecord::Base
	belongs_to :release_account, class_name: "AnalyticAccount"
	belongs_to :retrieve_account, class_name: "AnalyticAccount"
 
	after_create :update_balance
  # before_update :undo_operation
  # after_update :update_balance
  

  validates :value, presence: true


def verify_account(account)
    # switch/case para verificar tipo de conta pelo código 

      case account.synthetic_account.account.account_type.code

      when 1
        # Ação para crédito/débito nas contas do Ativo
        if retrieve_account.eql? account
           retrieve_account.name
        else
           release_account.name
        end
          
      when 2
        # Ação para crédito/débito nas contas do Passivo
        if retrieve_account.synthetic_account.account.account_type.code.eql? 3
           retrieve_account.name
        elsif release_account.eql? account
           release_account.name
          
        else
           retrieve_account.name
        end

      when 3
        # Ação para crédito/débito nas contas do Passivo
        if retrieve_account.eql? account
           release_account.name
        else
           retrieve_account.name
        end
          
      else
        # Ação default
        if release_account.eql? account
           release_account.name
        else
           retrieve_account.name
        end
      end
  end
private

  


  def update_balance
    

    case self.retrieve_account.synthetic_account.account.account_type.code
      
      when 1
        # Ação para crédito/débito nas contas do Ativo
        
        retrieve_value = self.retrieve_account.balance + self.value

          
      when 2
        # Ação para crédito/débito nas contas do Passivo

        if self.release_account.synthetic_account.account.account_type.code.eql? 3
          retrieve_value = self.retrieve_account.balance - self.value
        end

        retrieve_value = self.retrieve_account.balance + self.value
      when 3
        # Ação para crédito/débito nas contas do Passivo
      
        retrieve_value = self.retrieve_account.balance + self.value
             
      else
       
      end

    case self.release_account.synthetic_account.account.account_type.code
      when 1
        # Ação para crédito/débito nas contas do Ativo
        release_value = self.release_account.balance - self.value
        
          
      when 2
        # Ação para crédito/débito nas contas do Passivo
        release_value = self.release_account.balance - self.value
        

        # Ação para crédito/débito nas contas do Receita
      when 3
        # Ação de crédito/débito quando o valor de onde vem é do ativo
        if self.retrieve_account.synthetic_account.account.account_type.code.eql? 1
          release_value = self.release_account.balance + self.value

          # Ação de crédito/débito quando o valor de onde vem é do passivo
        elsif self.retrieve_account.synthetic_account.account.account_type.code.eql? 2
          release_value = self.release_account.balance - self.value 
        end
        
      else
        
      end
    self.release_account.update(balance: release_value)
    self.retrieve_account.update(balance: retrieve_value)
    
    @ob1 = OldBalance.new(operation: self, analytic_account: self.retrieve_account, value: retrieve_value)
    @ob1.save
    @ob2 = OldBalance.new(operation: self, analytic_account: self.release_account, value: release_value)
    @ob2.save
  end
  
end

