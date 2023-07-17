class Card < ApplicationRecord
  validates :title, presence: true
  enum status: { "Triage": 0, "Figuring it Out": 1, "In Progress": 2, "Done": 3, "Not Now": 4 }

  has_many :comments, dependent: :destroy
  has_many :card_users, dependent: :destroy
  has_many :users, through: :card_users
end
