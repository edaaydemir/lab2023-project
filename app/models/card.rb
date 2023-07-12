class Card < ApplicationRecord

  validates :title, presence: true
  enum status: { "Triage": 0, "Figuring it Out": 1, "In Progress": 2, "Done": 3, "Not Now": 4 }

end
