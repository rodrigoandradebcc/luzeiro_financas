class ChartOfAccount < ActiveRecord::Base
  belongs_to :company

  has_many :first_levels
end
