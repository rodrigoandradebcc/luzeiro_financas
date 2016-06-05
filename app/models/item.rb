class Item < ActiveRecord::Base
  belongs_to :subelement
  has_many :subitem
end
