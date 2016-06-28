class FirstLevel < ActiveRecord::Base
  belongs_to :chart_of_account
  belongs_to :balance
end
