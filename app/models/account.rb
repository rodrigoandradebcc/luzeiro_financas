class Account < ActiveRecord::Base
  belongs_to :chart_of_account
  has_many :group

  has_many :operation

end
