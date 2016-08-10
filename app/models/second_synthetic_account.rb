class SecondSyntheticAccount < ActiveRecord::Base
  belongs_to :synthetic_account

  has_many :analytic_accounts, dependent: :destroy

  def synthetic_account_name
    "#{synthetic_account.account.account_type.name} #{synthetic_account.account.name} #{synthetic_account.name} #{name}"
  end
end
