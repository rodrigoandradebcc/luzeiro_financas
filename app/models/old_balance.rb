class OldBalance < ActiveRecord::Base
  belongs_to :operation
  belongs_to :analytic_account
end
