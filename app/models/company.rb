class Company < ActiveRecord::Base
  belongs_to :user

  has_one :chart_of_account
end
