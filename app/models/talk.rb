class Talk < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  belongs_to :storyline, optional: true
  after_create_commit { TalkBroadcastJob.perform_later self }
  after_update_commit { TalkBroadcastJob.perform_later self }
  after_destroy_commit { TalkBroadcastJob.perform_later self }
end
