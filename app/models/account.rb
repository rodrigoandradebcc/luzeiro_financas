class Account < ActiveRecord::Base
  belongs_to :chart_of_account
  has_many :group
  has_many :operation

  validates_presence_of :code, :name, :description, :chart_of_account_id


end
