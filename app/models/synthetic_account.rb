class SyntheticAccount < ActiveRecord::Base
  belongs_to :account

  has_many :second_synthetic_accounts, dependent: :destroy

  def synthetic_account_name
    "#{account.account_type.code}.#{account.code}.#{code} - #{name}"
  end
end
