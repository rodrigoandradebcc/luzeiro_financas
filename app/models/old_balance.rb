class OldBalance < ActiveRecord::Base
  belongs_to :operation
  belongs_to :analytic_account

  def self.balance op, anal
  	  @old_balance = OldBalance.find_by(operation: op, analytic_account: anal)
      where("analytic_account_id = ? AND created_at < ?", anal, @old_balance.created_at).sum(:value)
  end

end
