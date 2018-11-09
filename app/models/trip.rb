class Trip < ApplicationRecord
  has_many :mood_trips
  has_many :moods, through: :mood_trips
  has_many :users, through: :mood_trips
  has_many :trip_categories
  has_many :categories, through: :trip_categories
  belongs_to :country
end
