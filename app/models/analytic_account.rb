class AnalyticAccount < ActiveRecord::Base
  belongs_to :second_synthetic_account
  
  
  has_many :operations
  has_many :oldbalances	
  
  
end
