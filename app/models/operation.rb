class Operation < ActiveRecord::Base
	has_and_belongs_to_many :fourth_level
	has_and_belongs_to_many :fifth_level
	has_and_belongs_to_many :sixth_level
	has_and_belongs_to_many :seventh_level
end
