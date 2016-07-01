class Company < ActiveRecord::Base
  belongs_to :user

  has_one :chart_of_account, dependent: :destroy
  accepts_nested_attributes_for :chart_of_account

end
