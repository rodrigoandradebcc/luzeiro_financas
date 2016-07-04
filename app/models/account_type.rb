class AccountType < ActiveRecord::Base
	has_many :accounts, dependent: :destroy

	belongs_to :chart_of_account
end
