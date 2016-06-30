class FirstLevel < ActiveRecord::Base
  belongs_to :chart_of_account
  belongs_to :balance

  has_many :first_level_second_levels
  has_many :second_levels, through: :first_level_second_level
end
