class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  after_create_commit { FormBroadcastJob.perform_later self }
  after_destroy_commit { FormBroadcastJob.perform_later self }
  # belongs_to :post_image,optional: true
  #
end
