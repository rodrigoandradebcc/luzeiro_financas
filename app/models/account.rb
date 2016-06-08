class Account < ActiveRecord::Base
  belongs_to :chart_of_account
  has_many :group

  has_and_belongs_to_many :operations

  validates_presence_of :code, :name, :description, :chart_of_account_id

end
