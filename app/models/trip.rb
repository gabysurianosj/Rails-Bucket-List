class Trip < ApplicationRecord
  has_many :mood_trips
  has_many :moods, through: :mood_trips
  has_many :users, through: :mood_trips
end
