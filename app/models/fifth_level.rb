class FifthLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :fourth_level

  has_many :sixth_levels
  has_and_belongs_to_many :operations
end
