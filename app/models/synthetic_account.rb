class SyntheticAccount < ActiveRecord::Base
  belongs_to :account

  has_many :second_synthetic_accounts, dependent: :destroy

  def account_name
    "#{account.account_type.name} #{account.name} #{name}"
  end
end
