class SeventhLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :sixth_level
end
