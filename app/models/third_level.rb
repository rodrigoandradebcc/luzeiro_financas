class ThirdLevel < ActiveRecord::Base
	belongs_to :balance
	belongs_to :second_level

	has_many :fourth_levels

	accepts_nested_attributes_for :balance
end
