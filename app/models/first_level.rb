class FirstLevel < ActiveRecord::Base
  has_one :chart_of_account
  belongs_to :balance

  has_many :first_level_second_levels
  has_many :second_levels, through: :first_level_second_level

  accepts_nested_attributes_for :balance


end
