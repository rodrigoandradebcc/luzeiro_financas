class Enterprise < ActiveRecord::Base
  has_one :chart_of_account,  autosave: true, dependent: :destroy
  has_many :accounts, through: :chart_of_account
  belongs_to :user

  validates_presence_of :chart_of_account
  accepts_nested_attributes_for :chart_of_account

  
end
