class User < ApplicationRecord
  validates :name, length: {maximum: 140}, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence:true
end
