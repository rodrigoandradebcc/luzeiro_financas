class FifthLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :fourth_level
end
