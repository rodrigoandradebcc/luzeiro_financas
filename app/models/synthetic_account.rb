class SyntheticAccount < ActiveRecord::Base
  belongs_to :account

  has_many :analytic_accounts, dependent: :destroy

  def account_name
    "#{self.account.account_type.name} #{self.account.name} - #{name}"
  end
end
