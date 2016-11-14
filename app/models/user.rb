class User < ApplicationRecord
  
  before_save { self.email.downcase! }
  
  validates :name, 
    length: {maximum: 50}, 
    presence: true
    
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
  validates :email, 
    format: { with: EMAIL_REGEX }, 
    presence:true, 
    length: {maximum: 255},
    uniqueness: { case_sensitive: false }
    
  validates :password, presence: true, length: { minimum: 6 }
    
  has_secure_password

  def User.digest(string) 
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
