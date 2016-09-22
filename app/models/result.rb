class Result < ActiveRecord::Base
  belongs_to :analytic_account

  has_many :analytic_accounts, as: :listenable
  has_many :operations, as: :operational
  has_one :analytic_account

  	
end