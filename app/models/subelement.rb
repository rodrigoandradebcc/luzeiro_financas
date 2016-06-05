class Subelement < ActiveRecord::Base
  belongs_to :element

  has_many :item
end
