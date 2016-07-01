class SixthLevel < ActiveRecord::Base
  belongs_to :balance
  belongs_to :fifth_level

  has_many :seventh_levels
  has_and_belongs_to_many :operations

  accepts_nested_attributes_for :balance
end
