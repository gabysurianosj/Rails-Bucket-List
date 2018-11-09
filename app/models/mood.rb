class Mood < ApplicationRecord
  belongs_to :user
  has_many :mood_trips
  has_many :trips, through: :mood_trips
end
