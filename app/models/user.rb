class User < ApplicationRecord
  
  before_save { self.email.downcase! }
  
  #username validation
  validates :name, 
    length: {maximum: 50}, 
    presence: true  
  
  #found on railstutorial.org 
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
  validates :email, 
    format: { with: EMAIL_REGEX }, 
    presence:true, 
    length: {maximum: 255},
    uniqueness: { case_sensitive: false }
    
  #password requirements
  validates :password, presence: true, length: { minimum: 6 }
    
  #signals to brcrypt that this object requires password hashing functionality, 
  #and an additional field in the database to store hashes
  has_secure_password

  def User.digest(string) 
    #Use the default time cost unless a less complex hash is specified as a system property
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  has_many :photos
end
