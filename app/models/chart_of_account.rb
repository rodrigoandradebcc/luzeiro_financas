class ChartOfAccount < ActiveRecord::Base
  has_many :account_types
  belongs_to :company
end
