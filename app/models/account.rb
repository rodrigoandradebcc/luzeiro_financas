class Account < ActiveRecord::Base
  
  belongs_to :account_type
  

  has_many :synthetic_accounts, dependent: :destroy
  

end
