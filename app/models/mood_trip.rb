class MoodTrip < ApplicationRecord
  belongs_to :mood
  belongs_to :trip
  belongs_to :user
end
