class Card < ApplicationRecord

  validates :title, presence: true
  enum status: { triage: 0, figuring_it_out: 1, in_progress: 2, done: 3, not_now: 4 }


end
