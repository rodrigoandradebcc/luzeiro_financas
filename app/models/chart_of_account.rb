class ChartOfAccount < ActiveRecord::Base
  belongs_to :enterprise
  has_many  :account
end
