class FirstLevelSecondLevel < ActiveRecord::Base
  belongs_to :first_level
  belongs_to :second_level
end
