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
        elsif retrieve_account.synthetic_account.account.account_type.code.eql? 2
          if retrieve_account.eql? account
            release_account.name
          else
            retrieve_account.name
          end
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

  def show_value(account)
    # switch/case para verificar tipo de conta pelo código 

    # Verifica se é retrieve account
    if account.eql? retrieve_account

      case account.synthetic_account.account.account_type.code

      when 1
       if release_account.synthetic_account.account.account_type.code.eql? 1
          value
         
       end
          
      when 2
        # Ação para crédito/débito nas contas do Passivo
        if retrieve_account.synthetic_account.account.account_type.code.eql? 3
           retrieve_account.name
        elsif retrieve_account.synthetic_account.account.account_type.code.eql? 2
          if retrieve_account.eql? account
            release_account.name
          else
            retrieve_account.name
          end
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

      # Verifica se é release account
      elsif account.eql? release_account

      case account.synthetic_account.account.account_type.code

      when 1
       if retrieve_account.synthetic_account.account.account_type.code.eql? 1
          0
        else
          value
         
       end
          
      when 2
        # Ação para crédito/débito nas contas do Passivo
        if retrieve_account.synthetic_account.account.account_type.code.eql? 3
           retrieve_account.name
        elsif retrieve_account.synthetic_account.account.account_type.code.eql? 2
          if retrieve_account.eql? account
            release_account.name
          else
            retrieve_account.name
          end
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

  end

  
def self.id_search(query)
  where("id like ?", "%#{query}%") 
end

def self.date_search(init, final)
  # where("created_at between %#{init}% and %#{final}%")
  date1 = Date.strptime(init, "%m/%d/%Y")
  date2 = Date.strptime(final, "%m/%d/%Y")

  where(created_at: date1..date2)
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

        else 
          retrieve_value = self.retrieve_account.balance + self.value 
        end


        
      when 3
        # Ação para crédito/débito nas contas do Receitas
      
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

