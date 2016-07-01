class SecondLevel < ActiveRecord::Base
  belongs_to :balance

  
  has_many :first_level_second_levels
  has_many :first_levels, through: :first_level_second_levels

  accepts_nested_attributes_for :balance
end
