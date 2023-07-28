class Comment < ApplicationRecord
  belongs_to :card
  belongs_to :user

  def user_name
    user.try(:name) || "Unknown User"
  end
end
