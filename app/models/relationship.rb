class Relationship < ApplicationRecord
  belongs_to :follower, optional: true, class_name: "User"
  belongs_to :followed, optional: true, class_name: "User"

end
