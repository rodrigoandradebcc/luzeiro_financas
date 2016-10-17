class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         belongs_to :role
         has_many :companies
  attr_accessor :login

after_initialize :set_default_role, :if => :new_record?

 def set_default_role
    self.role ||= Role.find_by_code(2)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def admin?
      self.role.code == 1
  end
end
