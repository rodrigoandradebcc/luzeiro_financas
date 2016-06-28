class SixthLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :fifth_level
end
