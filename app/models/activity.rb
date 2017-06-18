class Activity < ApplicationRecord
  serialize :ages
  has_many :users , through:  :subscribes
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :likes

  # like the post
  def like(user)
    likes << Like.new(user: user)
  end

  # unlike the post
  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
end
