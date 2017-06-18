class Like < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  ## We make sure that one user can only have one like per post
  validates :user_id, uniqueness: {scope: :activity_id}
end
