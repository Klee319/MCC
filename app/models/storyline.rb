
class Storyline < ApplicationRecord
  has_many :talks, dependent: :destroy
  has_many :talkrooms, dependent: :destroy
  has_many :users, through: :talkrooms
  has_many :tags, dependent: :destroy
  mount_uploader :image, ImageUploader
  after_create_commit { StorylineBroadcastJob.perform_later self }
  after_update_commit { StorylineBroadcastJob.perform_later self }
  after_destroy_commit { StorylineBroadcastJob.perform_later self }
end
