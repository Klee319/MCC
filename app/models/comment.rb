class Comment < ApplicationRecord
  belongs_to :user, optional: true # この行を追記
  belongs_to :post, optional: true # この行を追記
  validates :comment, presence: true, length: { maximum: 35 }
end


