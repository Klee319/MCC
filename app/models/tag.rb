class Tag < ApplicationRecord
  belongs_to :storyline, optional: true
  belongs_to :user, optional: true
end
