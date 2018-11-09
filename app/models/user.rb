class User < ApplicationRecord
  has_many :moods
  has_many :mood_trips
  has_many :trips, through: :mood_trips
   has_secure_password
end
