class Card < ApplicationRecord
  validates :title, presence: true
  enum status: { "Triage": 0, "Figuring it Out": 1, "In Progress": 2, "Done": 3, "Not Now": 4 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :assignments,  class_name: 'User'
end
