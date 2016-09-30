class SecondSyntheticAccount < ActiveRecord::Base
  belongs_to :synthetic_account

  has_many :analytic_accounts, dependent: :destroy

  def second_synthetic_account_name
    "#{synthetic_account.account.account_type.code}.#{synthetic_account.account.code}.#{synthetic_account.code}.#{code} - #{name}"
  end
end
