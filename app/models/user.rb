class User < ApplicationRecord
    has_many :comments
    has_many :cards
  
    has_secure_password
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  