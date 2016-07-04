class SyntheticAccount < ActiveRecord::Base
  belongs_to :account

  has_many :analytic_accounts, dependent: :destroy
end
