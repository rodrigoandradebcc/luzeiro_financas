class AnalyticAccount < ActiveRecord::Base
  belongs_to :synthetic_account
  
  
  has_many :operations

  
  
end
