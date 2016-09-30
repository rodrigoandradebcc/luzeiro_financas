class AccountType < ActiveRecord::Base
	has_many :accounts, dependent: :destroy
	
	belongs_to :chart_of_account

  def account_type_name
    "#{code} - #{name}"
  end
end
