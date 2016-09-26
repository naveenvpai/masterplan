class User < ApplicationRecord
  validates :name, 
    length: {maximum: 50}, 
    presence: true
    
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
  validates :email, 
    format: { with: EMAIL_REGEX }, 
    presence:true, 
    length: {maximum: 255},
    uniqueness: true
end
