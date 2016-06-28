class FourthLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :third_level
end
