class Enterprise < ActiveRecord::Base
  has_one :char_of_account

  belongs_to :user

end
