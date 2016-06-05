class Subgroup < ActiveRecord::Base
  belongs_to :Group

  has_many :element

end
