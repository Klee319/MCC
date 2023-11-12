class Post < ApplicationRecord
  mount_uploader :image_id, ImageUploader
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many_attached :image do |attachable|
    attachable.variant :half, resize_to_limit: [256, 256]
  end
  validates :title, presence: true, length: { maximum: 15 }
  validates :text, presence: true, length: { maximum: 195 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
