class User < ApplicationRecord
    has_many :comments , dependent: :destroy
    has_many :cards , dependent: :destroy
    has_many :card_users , dependent: :destroy 
    has_many :assigned_cards , through: :card_users
  
    has_secure_password
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  