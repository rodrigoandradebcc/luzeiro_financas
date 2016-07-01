class FourthLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :third_level

  has_many :fifth_levels
  has_and_belongs_to_many :operations

  accepts_nested_attributes_for :balance
end
