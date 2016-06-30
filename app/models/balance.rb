class Balance < ActiveRecord::Base
	has_one :first_level
	has_one :second_level
	has_one :third_level
	has_one :fourth_level
	has_one :fifth_level
	has_one :sixth_level
	has_one :seventh_level
end
