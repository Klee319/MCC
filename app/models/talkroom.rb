class Talkroom < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :storyline, optional: true

end
