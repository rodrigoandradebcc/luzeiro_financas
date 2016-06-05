class Element < ActiveRecord::Base
  belongs_to :subgroup

  has_many :subelement

end
