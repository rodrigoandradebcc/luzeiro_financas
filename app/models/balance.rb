class Balance < ActiveRecord::Base
	has_one :first_level, autosave: true, dependent: :destroy
	has_one :second_level, autosave: true, dependent: :destroy
	has_one :third_level, autosave: true, dependent: :destroy
	has_one :fourth_level, autosave: true, dependent: :destroy
	has_one :fifth_level, autosave: true, dependent: :destroy
	has_one :sixth_level, autosave: true, dependent: :destroy
	has_one :seventh_level, autosave: true, dependent: :destroy

	
end
