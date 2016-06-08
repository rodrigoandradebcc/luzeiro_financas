class ChartOfAccount < ActiveRecord::Base
  belongs_to :enterprise
  has_many  :account

  validates_presence_of :title
  
end
