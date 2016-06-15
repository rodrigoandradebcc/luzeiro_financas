class ChartOfAccount < ActiveRecord::Base
  belongs_to :enterprise
  has_many  :accounts

  validates_presence_of :title
  
end
